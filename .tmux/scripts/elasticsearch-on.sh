#!/bin/bash

sudo lsof -s TCP:Listen -i :9200 &> /dev/null && echo "EL"
