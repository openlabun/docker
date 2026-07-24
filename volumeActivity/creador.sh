#!/bin/sh
for i in 1 2 3 4 5; do
  echo "Test $i" > /datos/test_$i.txt
  sleep 2
done

