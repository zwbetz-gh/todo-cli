#!/usr/bin/env bash

# Add to PATH
cp todo $HOME/bin

# Generate sample output
todo nuke > /dev/null
echo -e "\n\$ todo a \"Buy milk\""
todo a "Buy milk"

echo -e "\n\$ todo a \"Buy eggs\""
todo a "Buy eggs"

echo -e "\n\$ todo a \"Refill Millie's tennis balls\""
todo a "Refill Millie's tennis balls"

echo -e "\n\$ todo l"
todo l

echo -e "\n\$ todo e 2 \"Buy a lot of eggs\""
todo e 2 "Buy a lot of eggs"

echo -e "\n\$ todo l"
todo l

echo -e "\n\$ todo d 2"
todo d 2

echo -e "\n\$ todo l -a"
todo l -a

echo -e "\n\$ todo u 2"
todo u 2

echo -e "\n\$ todo l -a"
todo l -a

echo -e "\n\$ todo r 2"
todo r 2

echo -e "\n\$ todo l"
todo l

echo -e "\n\$ todo wipe"
todo wipe
