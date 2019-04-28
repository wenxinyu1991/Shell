#!/bin/bash

awk '{print $1}' 1.log |sort -nr |uniq |sort -n
