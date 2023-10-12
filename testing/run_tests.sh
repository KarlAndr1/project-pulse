#!/usr/bin/env bash

source ../env.sh

export LIGHTTPD_DATA_PATH="$(realpath ./data)"

export www="$(realpath ../www)"

for test_case in ./tests/*; do
	cd $test_case
	echo "Test case $test_case"
	for test in ./*.sh; do
		cd ../../
		./init_tests.sh
		cd $test_case
		if [ -f env ]; then
			source ./env
		fi
		
		echo "Test $(basename $test_case)/$(basename $test)"
		bash $test
		if [[ $? -ne 0 ]]; then
			echo "Test failed!"
		fi
	done
	cd ../../
done
