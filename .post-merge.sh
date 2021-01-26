#!/bin/sh

# Concat all files ending with .gitignore into a single temporary file
find . -type f -name "*.gitignore" -exec sh -c 'cat {} >> ".gitignore_packlink.new"' \;

# Remove entry that ignores untracked files
sed -i -e '/^\/\*$/d' ./.gitignore_packlink.new

# Remove entry that ignores untracked files under src folder
sed -i -e '/^src\/$/d' ./.gitignore_packlink.new

# Remove entry that ignores untracked sql files
sed -i -e '/^\*\.sql$/d' ./.gitignore_packlink.new

# Remove entry that ignores untracked certificates
sed -i -e '/^\*\.crt$/d' ./.gitignore_packlink.new

# Remove entry that ignores the \config folder
sed -i -e '/^\/config\/\*$/d' ./.gitignore_packlink.new

# Remove entry that ignores xml files
sed -i -e '/^\*\.xml$/d' ./.gitignore_packlink.new

# Remove entry that ignores the test/ folder
sed -i -e '/^test\/$/d' ./.gitignore_packlink.new

# Remove entry that ignores the _snapshots_/ folder
sed -i -e '/^_snapshots_\/$/d' ./.gitignore_packlink.new

# Remove entry that ignores snap files
sed -i -e '/^\*\.snap$/d' ./.gitignore_packlink.new

# Remove entry that ignores stage/ folder
sed -i -e '/^stage\/$/d' ./.gitignore_packlink.new

# Move the temporary file into the final location
mv ./.gitignore_packlink.new $HOME/.gitignore_packlink

# Remove temporary file
rm -f ./gitignore_packlink.new
