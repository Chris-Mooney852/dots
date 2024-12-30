#!/bin/nu

def main [
  --time
  --date
] {

  if $time {
    date now | format date "%I:%M"
  } else if $date {
    date now | format date "%a, %d %h"
  }
}
