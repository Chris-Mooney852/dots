#!/bin/nu
use std log

(
  i3-msg -t subscribe -m '["workspace"]'
) | each {|i|
    if $i != nothing {
    let workspaces = (i3-msg -t get_workspaces | from json)
    mut final = "(box :class \"workspace\" :orientation \"h\" :spacing 5 "

    for $x in 0..5 {
      let result = try { 
        let workspace = $workspaces | get $x
        let num = $workspace | get num
        let focused = $workspace | get focused
        let urgent = $workspace | get urgent

        if $focused {
          $" \(button :onclick 'i3-msg workspace number ($num)' '' \)"
        } else if $urgent {
          $" \(button :onclick 'i3-msg workspace number ($num)' ''  \)"
        } else {
          # TODO: change this to greyed out solid
          $" \(button :onclick 'i3-msg workspace number ($num)' '󰪥'  \)"
        }
      } catch { |err|
          $" \(button :onclick 'i3-msg workspace number ($x)' ''  \)"
      }


      $final = $final + $result
    }

    $final = $final + ")"

    print $final
  }
}
