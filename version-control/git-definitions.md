# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

With version control, multiple people can edit the same files simultaneously, and then easily merge their edits. Version control keeps track of the edits, and if you break the program you can roll back to an earlier version where it worked. 

* What is a branch and why would you use one?

Creating a branch allows you to "check out" the repository and edit as you please, without worrying about breaking the master branch that you know is functional. When you're done editing, you can merge your branch back into the master. You can also undo a merge, if you discover you broke something.

* What is a commit? What makes a good commit message?

Before you commit a change, you have to stage the files you changed. You then commit the files, meaning you've officially updated them in the repository. You've created a save point, which allows you to keep track of your edits and roll back to a previous save point. A good commit message describes the purpose of the changes clearly.

* What is a merge conflict?

A merge conflict happens when you try to merge two branches where the same line of a file was edited in conflicting ways, or where a file was deleted on one branch but edited on another. When you have a conflict, git will show you where and what it was and allow  you to solve the conflict.

:)