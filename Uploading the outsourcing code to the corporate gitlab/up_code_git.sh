#!/bin/bash

cd ./source/

git switch target_branch #checkout
git pull
git push -u origin master -o merge_request.create

