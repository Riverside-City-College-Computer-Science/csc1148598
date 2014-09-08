echo "Hello $USER. we are going to run store"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./store ; echo $?