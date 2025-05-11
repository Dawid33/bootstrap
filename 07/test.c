#include <iostream>

int main () {
   try {
      throw "OK";
   } catch (const char* msg) {
     std::cerr << msg << std::endl;
   }
   return 0;
}
