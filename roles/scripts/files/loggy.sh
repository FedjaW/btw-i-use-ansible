#!/bin/bash

# Author: Friedrich Wilms
# Date Created: 5.2.24
# Date Modified: 5.2.24

# Description:
# Logs the provided message with a timestamp

# Usage:
# lagger "here comes your message"

echo `date +'%F %T'` $* >> `date +%F`.log

exit 0