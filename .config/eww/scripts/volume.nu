#!/bin/nu

def main [
  --getVolume
  --getVolumeIcon
] {

  if $getVolumeIcon {
    let mute = (pamixer --get-mute) | into bool

    if $mute {
      return "󰝟"
    } else {
      let volume = (pamixer --get-volume) | into int

      if $volume < 33 {
        return "󰕿"
      }

      if $volume >= 33 and $volume < 66 {
        return "󰖀"
      }

      return "󰕾"
    }
  } else if $getVolume {
      (pamixer --get-volume) | into int
  } 
}
