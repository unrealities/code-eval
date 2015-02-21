#!/bin/sh
source $(dirname $0)/find_a_writer.sh ../test_input.txt
source $(dirname $0)/test_helper.sh

#test result expectations
expect=('Stephen King 1947' 'Kyotaro Nishimura 1930')

run_tests_for find_a_writer
