local status, flutterTools = pcall(require, "flutter-tolls")
if (not status) then return end

flutterTools.setup {
  flutter_path = "",
  widget_guides = {
    enabled = true
  }
}
