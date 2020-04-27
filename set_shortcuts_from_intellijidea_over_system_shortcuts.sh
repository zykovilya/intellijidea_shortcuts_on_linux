#!/usr/bin/env bash

echo "Your desktop is $DESKTOP_SESSION"
KB_SETTING_PATH="org.$DESKTOP_SESSION.desktop.keybindings.wm"
echo "Base of settings is $KB_SETTING_PATH"

#find system keybindings:
# gsettings list-recursively | grep '<Alt>F7'
#find system hotkeys with base gnome:
# gsettings list-recursively | grep "org.gnome.desktop.wm.keybindings"
#find system hotkeys:
# gsettings list-recursively | grep "org.$DESKTOP_SESSION.desktop.keybindings.wm"

function changeHotKey() {
  echo "Change shortcut $2 to $3"
  echo "value after change $(gsettings get $1 $2)"

  if test -z "$3"
      then gsettings set  $1  $2 "@as []"
      else gsettings set  $1  $2 "['$3']"
  fi
}

#switch-input-source if you need
#changeHotKey "org.gnome.desktop.wm.keybindings"  "switch-input-source" "<Alt>Shift_L"

changeHotKey "$KB_SETTING_PATH"  "begin-move" "<Super>F7"
changeHotKey "$KB_SETTING_PATH"  "begin-resize" ""
changeHotKey "$KB_SETTING_PATH"  "begin-move" ""
changeHotKey "$KB_SETTING_PATH"  "switch-to-workspace-up" "<Super><F1>"
changeHotKey "$KB_SETTING_PATH"  "unmaximize" "<Super><F5>"

changeHotKey "$KB_SETTING_PATH"  "switch-to-workspace-right" "<Super><Alt>Right"
changeHotKey "$KB_SETTING_PATH"  "switch-to-workspace-left" "<Super><Alt>Left"

#TODO change LOCK SCREEN Ctrl+Alt+L on system shortcuts --> Lock Screen
