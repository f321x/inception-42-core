#!/bin/bash

# First argument is the operation: -e for encryption, -d for decryption
operation=$1

# Second argument is the password
password=$2

# Check if operation is either -e (encrypt) or -d (decrypt)
if [ "$operation" != "-e" ] && [ "$operation" != "-d" ]; then
  echo "Invalid operation. Use -e for encryption or -d for decryption."
  exit 1
fi

# Loop through each file in the secrets directory
for file in ./secrets/*; do
  # If operation is -e, encrypt the file
  if [ "$operation" == "-e" ]; then
    openssl enc -aes-256-cbc -pbkdf2 -in "$file" -out "${file}_encrypted" -pass pass:$password
	  rm $file
  # If operation is -d, decrypt the file
  elif [ "$operation" == "-d" ]; then
    openssl enc -d -aes-256-cbc -pbkdf2 -in "$file" -out "${file%_encrypted}" -pass pass:$password
	  rm $file
  fi
done
