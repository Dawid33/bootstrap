#!/bin/sh

# Receives files as arguments, scans them for lines like
# #> FETCH dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3
# #>  FROM http://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz
# #>    AS make.tar.gz
# or
#   #local = "/downloads/make.tar.gz";
#   url = "http://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz";
#   sha256 = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3";
# downloads to ./downloads if file's not present there yet, verifies hash,
# copies file over to $DESTDIR.

set -ue

: ${DESTDIR:=stage/downloads}  # final location of putting the file
: ${ONLY:=all}  # allow to limit to just a single file
mkdir -p downloads   # first cached there, so that stage can be cleaned freely

fetch() {
	hash=$1; url=$2; filename=${3:-$(basename "$url")}
	if [ -e "downloads/$filename" ]; then
		cd downloads 
			echo "$hash $filename" | sed -e 's/^[[:space:]]*//' | sha256sum -c
		cd -
	else
		echo "wget -t 0 $url"
		mkdir -p downloads/.tmp$$
		cd  downloads/.tmp$$
			wget -t 0 "$url" -O "$filename" --no-check-certificate
			echo "$hash $filename" | sed -e 's/^[[:space:]]*//' > .sha
			sha256sum -c .sha
		cd - 
		mv "downloads/.tmp$$/$filename" downloads/
		rm -rf downloads/.tmp$$
	fi
	if [ "${DESTDIR:-}" != downloads ]; then
		mkdir -p "$DESTDIR"
		cp -a --reflink=auto "downloads/$filename" \
			"$DESTDIR/$filename"
	fi
}

REGEX_MAGIC='^#> '
REGEX_FETCH='^#> FETCH'
REGEX_FROM='^#>  FROM'
REGEX_AS='^#>    AS'
NIX_REGEX_FETCH='^[[:blank:]]*sha256[[:blank:]]*=[[:blank:]]*"(.*)";$'
NIX_REGEX_FROM='^[[:blank:]]*url[[:blank:]]*=[[:blank:]]*"(.*)";$'
NIX_REGEX_AS='^[[:blank:]]*#[[:blank:]]local[[:blank:]]*=[[:blank:]]*/downloads/(.*);$'
process_commands_in() {
	hash=''; url=''; filename=''
	while read -r line; do
		if echo "$line" | grep -q "$REGEX_MAGIC"; then
			if echo "$line" | grep -q "$REGEX_FETCH"; then
				hash="${line##"#> FETCH"}"
			elif echo "$line" | grep -q "$REGEX_FROM"; then
				url="${line##'#>  FROM '}"
			elif echo "$line" | grep -q "$REGEX_AS"; then
				filename="${line##'#>    AS '}"
			else
				echo "### $0: malformed line '$line' in '$1'"
				exit 2
			fi
		elif echo "$line" | grep -q $NIX_REGEX_FETCH; then
		     hash=${BASH_REMATCH[1]}
		elif echo "$line" | grep -q $NIX_REGEX_FROM; then
		     url=${BASH_REMATCH[1]}
		elif echo "$line" | grep -q $NIX_REGEX_AS; then
			filename=${BASH_REMATCH[1]}
		else
			if [ -n "$hash" ] && [ -n "$url" ]; then
				filename=${filename:-$(basename $url)}
				if [ "$ONLY" == all ] || [ "$ONLY" == "$filename" ]; then
					fetch "$hash" "$url" "$filename"
				fi
			fi
			hash=''; url=''; filename=''
		fi
	done < $1
}

[ $# == 0 ] && files='recipes/*.sh recipes/*/*.sh' || files="$@"
for f in $files; do
	process_commands_in $f
done
