#!/bin/bash

echo Digite a tag:
read vartag

if [[ $vartag != "" ]]; then
    serverpod create-migration --tag $vartag
else
    serverpod create-migration
fi



