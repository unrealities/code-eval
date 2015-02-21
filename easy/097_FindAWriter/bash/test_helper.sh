#!/bin/sh
test=0
declare -i failures=0
failure_output=""

function starting_test {
  echo ------------------
  echo TEST STARTING NOW
  echo ------------------
}

function run_test {
  while read line || [[ -n "$line" ]]; do
    $1 "$line"
    check_for_failures
  done < ../test_input.txt
}

function check_for_failures {
  if [ "$decoded_message" != "${expect["$test"]}" ]
  then
    failure_output+="Expected: ${expect["$test"]} | Got: $decoded_message\n"
    failures+=1
  fi
  test+=1
}

function finishing_test {
  echo ------------------
  echo TEST RESULTS BELOW
  echo ------------------
}

function test_results {
  if [ $failures -eq 0 ]
  then
    echo SUCCESS!
    echo ------------------
    echo
  else
    echo "THERE WERE $failures FAILURES"
    echo ------------------
    echo $failure_output
  fi
}

function run_tests_for {
  starting_test
  run_test $1
  finishing_test
  test_results
}