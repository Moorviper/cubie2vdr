#!/bin/sh
case "$1" in
    before)
           echo "Before recording $2"
           echo 1 > /sys/class/gpio/gpio17_pg9/value
           count=${REC}
           REC=count+1;
           ;;
    after)
           echo "After recording $2"
           if [ ${REC} -gt 0 ]; then
	       echo 1 > /sys/class/gpio/gpio17_pg9/value
           else
	       echo 0 > /sys/class/gpio/gpio17_pg9/value
           fi
           
           ;;
    edited)
           echo "Edited recording $2"
           i=1
           while [ $i -le 3 ]
           do
           echo 1 > /sys/class/gpio/gpio17_pg9/value
           sleep 1
           echo 0 > /sys/class/gpio/gpio17_pg9/value
           sleep 1;
           i=`expr $i + 1`
           done
           if [ ${REC} -gt 0 ]; then
	       echo 1 > /sys/class/gpio/gpio17_pg9/value
           else
	       echo 0 > /sys/class/gpio/gpio17_pg9/value
           fi
           ;;
    *)
           echo "ERROR: unknown state: $1"
           i=1
           while [ $i -le 3 ]
           do
           echo 1 > /sys/class/gpio/gpio17_pg9/value
           sleep 3
           echo 0 > /sys/class/gpio/gpio17_pg9/value
           sleep 2;
           i=`expr $i + 1`
           done
           if [ ${REC} -gt 0 ]; then
	       echo 1 > /sys/class/gpio/gpio17_pg9/value
           else
	       echo 0 > /sys/class/gpio/gpio17_pg9/value
           fi
           ;;
esac
