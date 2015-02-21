#!/bin/sh
function parse_input {
  IFS='|' read -a split_input <<< "$1"

  i=0; while [ $i -lt ${#split_input[0]} ]; do
    encoded_message[$i]=${split_input[0]:$i:1}
    i=$((i+1))
  done

  read -a cipher <<< "${split_input[1]}"
}

function decode {
  decoded_message=""
  for i in "${!cipher[@]}"; do
    decoded_message+="${encoded_message[${cipher[i]}-1]}"
  done
}

function find_a_writer {
  parse_input "$1"
  decode
  echo $decoded_message
}

while read line || [[ -n "$line" ]]; do
  find_a_writer "$line"
done < $1
