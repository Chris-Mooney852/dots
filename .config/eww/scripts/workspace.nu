#!/bin/nu

(
  i3-msg -t subscribe -m '["workspace"]'
) | each {|i|
    if $i != nothing {
    let workspaces = (i3-msg -t get_workspaces | from json)
    mut final = "(box :class \"workspace\" :orientation \"h\" :spacing 5 "

    for workspace in $workspaces {
      let num = $workspace | get num
      let focused = $workspace | get focused
      let urgent = $workspace | get urgent

      if $focused {
        $final = $final + $" \(button :onclick 'i3-msg workspace number ($num)' '' \)"
      } else if $urgent {
        $final = $final + $" \(button :onclick 'i3-msg workspace number ($num)' ''  \)"
      } else {
        $final = $final + $" \(button :onclick 'i3-msg workspace number ($num)' ''  \)"
      }
    }

    $final = $final + ")"

    print $final
  }
}
