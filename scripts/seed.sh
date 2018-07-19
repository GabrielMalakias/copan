#!/bin/sh

number=0

while [ $number -lt 25 ]
do
  mix run ./priv/repo/appointment_seeds.exs
done
