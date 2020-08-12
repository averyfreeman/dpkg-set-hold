#!/bin/sh
printf "\n\nThis script is for preventing certain packages from being updated by apt on a Debian-like OS"
printf "\nWhat packages would you like to hold?  String will be used for grep: "
read name
dpkg -l | awk '/^[hi]i/{print $2}' | grep $name > $name-packages.txt
cat $name-packages.txt
printf "\nDoes this list look acceptable?"
printf "\nPress enter to continue or ctrl-c to abort...\n"
read continue
printf "\nMarking packages for hold...\n"
cat $name-packages.txt | while read line; do echo $line hold | sudo dpkg --set-selections; done
printf "\nPackages now marked for hold:\n\n"
dpkg --get-selections | grep $name
printf "\n\n"
while true; do
  read -p "Do you want to reverse these changes? " yn
    case $yn in
        [Yy]* ) cat $name-packages.txt | while read line; do echo $line install | sudo dpkg --set-selections; done; dpkg --get-selections | grep $name; printf "\nHolds reversed.  All done!\n"; exit;;
        [Nn]* ) printf "\nHolds kept. All done!\n"; break;;
        * ) printf "\nPlease answer yes or no: ";;
    esac
done