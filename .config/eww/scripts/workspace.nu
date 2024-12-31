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
          $" \(label :class 'focused' :text '' \)"
        } else if $urgent {
          $" \(label :text ''  \)"
        } else {
          $" \(label :text ''  \)"
        }
      } catch { |err|
          $" \(label :text ''  \)"
      }


      $final = $final + $result
    }

    $final = $final + ")"

    print $final
  }
}
