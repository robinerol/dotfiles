#!/bin/bash

print_input "ItelliJ CE (y/n)?"
read INTELLIJ_VERSION
INTELLIJ_PATH=/Applications/IntelliJ\ IDEA.app/Contents/plugins
if [ "$INTELLIJ_VERSION" != "${INTELLIJ_VERSION#[Yy]}" ] ;then
    INTELLIJ_PATH=/Applications/IntelliJ\ IDEA\ CE.app/Contents/plugins
fi

print "Installing JumpToLine..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=151560 -O JumpToLine
unzip -o -d "$INTELLIJ_PATH" JumpToLine
rm JumpToLine

print "Installing CheckStyleIdea..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=159259 -O CheckStyleIdea
unzip -o -d "$INTELLIJ_PATH" CheckStyleIdea
rm CheckStyleIdea

print "Installing Frame Switcher..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=143276 -O FrameSwitcher
unzip -o -d "$INTELLIJ_PATH" FrameSwitcher
rm FrameSwitcher

print "Installing Gradianto..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=106256 -O Gradianto
unzip -o -d "$INTELLIJ_PATH" Gradianto
rm Gradianto

print "Installing Lines Sorter..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=13587 -O LinesSorter
unzip -o -d "$INTELLIJ_PATH" LinesSorter
rm LinesSorter

print "Installing Nyan Progress Bar..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=73820 -O NyanProgressBar
unzip -o -d "$INTELLIJ_PATH" NyanProgressBar
rm NyanProgressBar

print "Installing Rainbow Brackets..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=134110 -O RainbowBrackets
unzip -o -d "$INTELLIJ_PATH" RainbowBrackets
rm RainbowBrackets

print "Installing Google Java Format..."
wget https://plugins.jetbrains.com/plugin/download\?rel\=true\&updateId\=159259 -O GoogleJavaFormat
unzip -o -d "$INTELLIJ_PATH" GoogleJavaFormat
rm GoogleJavaFormat
