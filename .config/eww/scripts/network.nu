#!/bin/nu

let network = sys net

for station in $network {
  let name = $station | get name

  if $name == "wlan0" {
    let ipLength = $station | get ip | length


    if $ipLength > 1 {
      print "󰤨"
    } else {
      print "󰤯"
    }
  }
}
