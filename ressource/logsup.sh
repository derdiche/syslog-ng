#!/bin/bash
rm -fr "/var/log/client/"`date '+%C%y/%m/%d' -d "-90 days"` 
