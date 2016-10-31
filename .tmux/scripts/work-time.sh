#!/bin/bash

t  today work | grep Total | awk '{print $2}' | cut -d ':' -f1,2
