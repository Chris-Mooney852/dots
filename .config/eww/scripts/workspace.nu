#!/bin/nu

#(
#  i3-msg -t subscribe -m '["workspace"]'
#) | each {|i|
#    if $i != nothing {
#    let workspaces = (i3-msg -t get_workspaces | from json)
#
#    for workspace in $workspaces {
#      let num = $workspace | get num
#      let focused = $workspace | get focused
#
#      if $focused {
#        print $num
#      }
#    }
#  }
#}


(
  i3-msg -t subscribe -m '["workspace"]'
) | each {|i|
    if $i != nothing {
    let workspaces = (i3-msg -t get_workspaces | from json)
    mut final = "(box :class \"workspace\" :orientation \"h\" :spacing 5 "

    for workspace in $workspaces {
      let num = $workspace | get num
      let focused = $workspace | get focused

      if $focused {
        $final = $final + $" \(button \)"
      } else {
        $final = $final + $" \(button \)"
      }
    }

    $final = $final + ")"

    print $final
  }
}
