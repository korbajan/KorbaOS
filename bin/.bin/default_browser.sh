#!/bin/bash
if [ "$DEFAULT_BROWSER" == "" ]
then
	DEFAULT_BROWSER=firefox
fi

$DEFAULT_BROWSER "$@"
