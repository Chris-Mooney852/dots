#!/bin/nu

let devices = (bluetoothctl -- devices)

if $devices != nothing {
  print "󰂱"
} else {
  print "󰂲"
}
