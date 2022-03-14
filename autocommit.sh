#!/usr/bin/env bash

while getopts m:t: flag
do
    case "${flag}" in
        m) message=${OPTARG};;
        t) tag=${OPTARG};;
    esac
done

git add .
git commit -m "$message"
git push
git tag -a $tag -m "$tag"
git push origin $tag