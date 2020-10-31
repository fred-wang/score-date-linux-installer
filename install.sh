#!/bin/bash
# Copyright 2020 Frédéric Wang. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Setup.
RELEASES=https://github.com/shlomiv/ScoreDate/releases/download/
VERSION=3.3
RELEASE_JAR=$RELEASES/$VERSION/score-date-0.3.3-SNAPSHOT-standalone.jar
RELEASE_EXERCISES=$RELEASES/$VERSION/Exercises.tar.gz
INSTALL_DIRECTORY=`pwd`

# Verify prerequisites.
for program in wget tar java sed; do
    echo -n "Looking for $program... "
    if ! which $program; then
        echo "$program not found!";
        exit 1;
    fi
done

# Download release and setup desktop app launcher.
mkdir -p $INSTALL_DIRECTORY
cd $INSTALL_DIRECTORY
wget $RELEASE_JAR -O score-date.jar
wget $RELEASE_EXERCISES -O tmp.tar.gz; tar -xvzf *.tar.gz; rm tmp.tar.gz
sed 's|@INSTALL_DIRECTORY@|'$INSTALL_DIRECTORY'|' score-date.desktop.in > ~/.local/share/applications/score-date.desktop
