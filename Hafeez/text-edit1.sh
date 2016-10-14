#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
printf "This is ${RED}red${NC} in colour\n"
BOLD='\033[1m'
printf "This text is ${BOLD}bold${NC} and this is not\n"
Underline='\033[4m'
printf "This text is ${Underline}underlined${NC} and this not\n"

