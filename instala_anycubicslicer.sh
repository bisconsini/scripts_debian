#!/bin/bash

set -e
#[--------------------------------------------------------------------------------------------]
cp -r softwares/AnycubicSlicer /opt/anycubicslicer

chmod +x /opt/anycubicslicer/AppRun

mv /opt/anycubicslicer/AnycubicSlicer.desktop /usr/share/applications/
chmod 644 /usr/share/applications/AnycubicSlicer.desktop

update-desktop-database /usr/share/applications
#[--------------------------------------------------------------------------------------------]
