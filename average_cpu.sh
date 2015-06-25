#!/bin/bash

cpunum=`lscpu | grep  '^CPU(s):' |awk '{print $2}'`;
echo $cpunum;


