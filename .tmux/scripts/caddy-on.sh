#!/bin/bash

lsof -s TCP:Listen -i :8000 &> /dev/null && echo "CY"
