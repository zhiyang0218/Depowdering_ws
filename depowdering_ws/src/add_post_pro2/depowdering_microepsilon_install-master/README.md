# README

This is the readme file for to test the LINUX SDK for MicroEpsilon ScanControl laser sensor.

## Installation

## File Sources
The **binaries(x86_64)** folder was originally obtained from the CERLAB Welding Group Box Folder. Please ask the Welding project lead for access to the folder if you would like to redownload the original files (The ones contained in this repository were not modified).

The aravis-0.4 files were obtained from [this repo](https://github.com/AravisProject/aravis). Please only use Aravis-0.4

## Install Instructions
- To install Aravis-0.4, input the following commands:
  *`cd aravis-0.4.0`
  *`./configure`
  *`make`
  *`sudo make install`

- To install the SDK, input the following commands from inside the binaries_x86_64 folder.
  *`sudo mkdir /usr/local/include/libllt`
  *`sudo mkdir /usr/local/include/libmescan`
  *`sudo cp libllt/libllt.h /usr/local/include/libllt`
  *`sudo cp libllt/LLTDataTypes.h /usr/local/include/libllt`
  *`sudo cp libmescan/libmescan.h /usr/local/include/libmescan`
  *`sudo cp libllt/libllt.so.1.0 /usr/local/lib`
  *`sudo cp libmescan/libmescan.so.1.0 /usr/local/lib`
  *`cd /usr/local/lib`
  *`sudo ln -s libllt.so.1.0 libllt.so`
  *`sudo ln -s libllt.so.1.0 libllt.so.1`
  *`sudo ln -s libmescan.so.1.0 libmescan.so`
  *`sudo ln -s libmescan.so.1.0 libmescan.so.1`
  *`sudo ldconfig`

## ROS Package

There is a ROS package for [MicroEpsilon ScanControl based on this SDK](https://github.com/iirob/microepsilon_scancontrol).
