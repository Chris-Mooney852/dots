#!/bin/nu

let devices = (bluetoothctl devices Connected | length)

if $devices != 0 {
  print "󰂱"
} else {
  print "󰂲"
}
