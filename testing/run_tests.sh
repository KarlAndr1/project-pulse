#!/usr/bin/env bash

source ../env.sh

export LIGHTTPD_DATA_PATH="$(realpath ./data)"

export www="$(realpath ../www)"

tests_done=0
tests_passed=0

for test_case in ./tests/*; do
	cd $test_case
	echo "Test case $test_case"
	for test in ./*.sh; do
		cd ../../
		./init_tests.sh
		cd $test_case
		
		echo "Test $(basename $test_case)/$(basename $test)"
		bash ../../exec_test.sh "$test"
		if [[ $? -ne 0 ]]; then
			echo "Test failed!"
		else
			tests_passed=$((tests_passed + 1))
		fi
		tests_done=$((tests_done + 1))
	done
	cd ../../
done

echo "$tests_passed/$tests_done tests passed"
