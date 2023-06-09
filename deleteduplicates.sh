#!/bin/bash

# Define the directory to search for duplicates
dir="/path/to/directory"

# Use fdupes to find and delete duplicates without prompting
fdupes -rdN "$dir"
