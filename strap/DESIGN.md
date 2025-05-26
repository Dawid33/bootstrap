
Goals:
- No automatic generation of luau files, most if not all cases where one might
  want to generate code based on templates should be covered by the system.

The name of a luau package file is arbitrary and it can define more
than one package definition. This is to keep the system generic, allowing for
edge cases where creating a file per package build may require code generation.

The cli accepts as input a package name and further parameters to differentiate
version, source locations, cpu architectures etc. In order to locate the .luau
file where this definition is stored, the system loads a repo.luau from a known
location. This repo.luau file contains a mapping of every package to a .luau
file, possibly allowing the use of regex's to reduce the size of the final
mapping.

1. Parse cli input
2. Load repo.luau file
3. Check if package is defined in reop.luau and execute its corresponding .luau
   file.
4. Excecute a step given from cli args that is defined in the .luau file or
   present possible options to the user.




