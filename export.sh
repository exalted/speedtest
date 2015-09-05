#!/usr/bin/env bash

# Load a familiar environment (brew, rbenv, etc.)
source $HOME/.bashrc

date_now=$(date +'%Y-%m-%d')
time_now=$(date +'%H:%M:%S')
results=$(sh -c ./main.rb | tail -1)

echo "$date_now;$time_now;$results"
