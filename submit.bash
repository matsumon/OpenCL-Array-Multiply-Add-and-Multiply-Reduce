#!/bin/bash
#SBATCH  -J  Six
#SBATCH  -A  cs475-575
#SBATCH  -p  class
#SBATCH  --gres=gpu:1
#SBATCH  -o  six.out
#SBATCH  -e  six.err
./script2