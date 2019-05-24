#include <unistd.h>
#include <iostream>

using namespace std;

main()
{
   cout << "before" << endl;
   int pid = fork();
   cout << pid << endl;
   if (pid==0) {
      execl("/bin/ls", "ls", "-r", "-t", "-l", (char *) 0);
   }
   cout << "done" << endl;
}