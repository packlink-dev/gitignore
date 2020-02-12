#!/bin/sh

# Concat all files ending with .gitignore into a single temporary file
find . -type f -name "*.gitignore" -exec sh -c 'cat {} >> ".gitignore_packlink.new"' \;

# Move the temporary file into the final location
mv ./.gitignore_packlink.new $HOME/.gitignore_packlink

# Remove temporary file
rm -f ./gitignore_packlink.new
