# op-tools_ubuntu_18.04
Install script for op-tools ubuntu 18.04

Ubuntu 16.04 script works with minimal editing.
Remove clang-3.8 from the installation script.

After installation edit tools/lib/framreader.py and remove the arguments to ffprobe -show_streams and -format.
