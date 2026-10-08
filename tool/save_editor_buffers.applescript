on saveAllKeystroke(useAltKey)
  tell application "System Events"
    if useAltKey then
      keystroke "s" using {command down, option down}
    else
      keystroke "s" using {command down}
    end if
  end tell
end saveAllKeystroke

on listContains(theList, theValue)
  repeat with itemRef in theList
    if contents of itemRef is theValue then
      return true
    end if
  end repeat
  return false
end listContains

on saveShortcutForProcess(procBundle, procName, saveAllOptionS, saveAllCommandS, namedOptionS, namedCommandS)
  if procBundle is not missing value and my listContains(saveAllOptionS, procBundle) then
    return true
  end if
  if procBundle is not missing value and my listContains(saveAllCommandS, procBundle) then
    return false
  end if
  if my listContains(namedOptionS, procName) then
    return true
  end if
  if my listContains(namedCommandS, procName) then
    return false
  end if
  return missing value
end saveShortcutForProcess

on run
  set saveAllOptionS to {"com.microsoft.VSCode", "com.microsoft.VSCodeInsiders", "com.visualstudio.code.oss", "com.vscodium", "com.todesktop.230313mzl4w4u92", "com.codeium.windsurf", "com.exafunction.windsurf", "dev.zed.Zed", "com.sublimetext.4", "com.sublimetext.3", "com.panic.Nova", "com.apple.dt.Xcode", "com.jetbrains.fleet"}
  set saveAllCommandS to {"com.google.android.studio", "com.jetbrains.intellij", "com.jetbrains.intellij.ce", "com.jetbrains.WebStorm", "com.jetbrains.phpstorm", "com.jetbrains.pycharm", "com.jetbrains.pycharm.ce", "com.jetbrains.rubymine", "com.jetbrains.clion", "com.jetbrains.goland", "com.jetbrains.rider", "com.jetbrains.datagrip", "com.jetbrains.aqua", "com.jetbrains.studio", "com.barebones.bbedit", "com.macromates.TextMate", "org.gnu.Emacs", "org.vim.MacVim"}
  set namedOptionS to {"Cursor", "Code", "Visual Studio Code", "VSCodium", "Windsurf", "Zed", "Nova", "Sublime Text", "Xcode", "Fleet"}
  set namedCommandS to {"Android Studio", "IntelliJ IDEA", "PyCharm", "WebStorm", "CLion", "GoLand", "RubyMine", "Rider", "DataGrip", "AppCode", "BBEdit", "TextMate"}

  tell application "System Events"
    repeat with proc in (every application process whose background only is false)
      try
        set procBundle to bundle identifier of proc
        set procName to name of proc
        set useAltKey to my saveShortcutForProcess(procBundle, procName, saveAllOptionS, saveAllCommandS, namedOptionS, namedCommandS)
        if useAltKey is not missing value then
          set frontmost of proc to true
          delay 0.05
          my saveAllKeystroke(useAltKey)
        end if
      end try
    end repeat
  end tell
end run
