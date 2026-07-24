#!/bin/sh
while true; do
  clear
  echo "Archivos en /datos:"
  ls /datos
  echo
  echo "Cantidad de archivos: $(ls -1 /datos | wc -l)"
  sleep 2
done

