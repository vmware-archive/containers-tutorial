#!/bin/bash -e 
cd /sys/fs/cgroup/memory/
ls
echo "let's create a new cgroup"
mkdir demo
cd demo/
echo "let's see what we have here... " 
ls
echo "so many many files"
echo "let's move our current shell into te cgroup"
echo $$ > tasks
cat tasks
echo "let's put a limit of 4M on our process"
echo 4M > memory.limit_in_bytes
echo "let's check the limits"
cat memory.limit_in_bytes
echo "let's check the current usage"
cat memory.usage_in_bytes
echo "let's try to start something with more memory requirements"
python
echo " let's reset our limits to infiniti"
echo -1 > memory.limit_in_bytes
echo "et voilà!!"
python

