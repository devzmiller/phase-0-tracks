1. What are some of the key design philosophies of the Linux operating system?

One major design philosophy of Linux is to provide small programs that do one thing very well. These small programs can then be combined to do a lot of bigger things in endless permutations, whereas a bigger program that did a lot of things could still only do those things, and couldn't be combined with other programs as easily. Other Linux philosophies are that portability is important and that it's effective and efficient to be able to reuse code (as one can do with open source software). Linux popularized open source, and because anyone can use and modify open source software, you get software that's created with the goal just to create good software.

2. In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

A VPS is a virtual server that behaves as a single machine, with its own operating system, but is actually one of several VPSs on a single physical server. The virtual machines are kept separate, but all live on the same machine. One advantage is that the VPS user has full access to the OS without restrictions, so it can be more fully configured. VPSs are typically more affordable than traditional physical servers, though they can also be less powerful, so they're good for businesses/websites expecting a lower level of traffic.

3. Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?

Running programs as the root user on Linux is a security risk. If you run programs as a regular user, you can only modify your home folder--meaning that if you encounter a virus or a program with a major bug, it can only mess up your home folder, and can't modify any system software. If you were running the program as the root user, that virus would be able to affect every file on the computer.