#!/bin/nu

try { 
  let musicDetails = (nc -W 1 -U "/run/user/1000/ncspot/ncspot.sock" | from json | get Playable)
  let title = $musicDetails.title
  let artists = $musicDetails.artists | str join ", "

  return $"󰝚  ($title) - ($artists)"
} catch { 
  return ""
}
