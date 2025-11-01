all: 
	$(MAKE) -C 00
	$(MAKE) -C 01
	$(MAKE) -C 02
	$(MAKE) -C 03
	$(MAKE) -C 04
	$(MAKE) -C 04a
	$(MAKE) -C 05
	# $(MAKE) -C 06
clean:
	$(MAKE) -C 00 clean
	$(MAKE) -C 01 clean
	$(MAKE) -C 02 clean
	$(MAKE) -C 03 clean
	$(MAKE) -C 04 clean
	$(MAKE) -C 04a clean
	$(MAKE) -C 05 clean
	# $(MAKE) -C 06 clean
