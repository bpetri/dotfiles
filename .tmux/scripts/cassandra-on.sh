#!/bin/bash

sudo /usr/bin/lsof -s TCP:Listen -i :9160 &> /dev/null && echo "CS"
