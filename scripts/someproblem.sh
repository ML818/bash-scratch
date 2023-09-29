#!/bin/bash

IFS=,

folder=people
name=john,jane,bond
mkdir $folder && cd $folder && touch $name
