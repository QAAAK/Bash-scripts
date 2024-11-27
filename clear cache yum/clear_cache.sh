#!bin/bash

sudo yum clean packages
echo 'Clean Cached YUM Packages'

sudo yum clean headers
echo 'Let’s delete the package headers'

sudo yum clean metadata
echo 'Clean Metadata for Enabled Repositories'

# sudo yum clean all
# echo 'Clean All YUM Cached Files'
