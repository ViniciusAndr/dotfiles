local status, flutterTools = pcall(require, "flutter-tools")
if (not status) then return end

require("flutter-tools").setup {
  flutter_path = "E:/flutter/bin/flutter.bat",
  widget_guides = {
    enabled = true
  }
}
