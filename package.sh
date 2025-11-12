#!/bin/bash

# Create dist directory if it doesn't exist
mkdir -p dist

# Go through each directory in skills/
for dir in skills/*/; do
  # Get the directory name (remove trailing slash and skills/ prefix)
  dirname=$(basename "$dir")
  
  # Create zip file in dist/ directory
  zip -r "dist/${dirname}.zip" "$dir"
  
  echo "Created dist/${dirname}.zip"
done

echo "Done! All archives created in dist/"

