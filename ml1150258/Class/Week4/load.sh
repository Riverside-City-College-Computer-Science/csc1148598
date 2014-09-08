echo "Hello $USER. we are going to run load"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
rm -vf *.o
./load ; echo $?