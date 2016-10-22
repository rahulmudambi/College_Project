#!/usr/bin/awk -f
{
  z = 142 - length
  y = int(z / 2)
  x = z - y
  printf "%*s%s%*s\n", x, "", $0, y, ""
}
