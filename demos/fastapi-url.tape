Output assets/fastapi-url-demo.svg

Set FontSize 16
Set Width 960
Set Height 480
Set Shell bash
Set MarginColor "#0d1117"
Set Theme {
  "name": "fastapi",
  "black": "#0d1117",
  "red": "#f85149",
  "green": "#3fb950",
  "yellow": "#e3b341",
  "blue": "#58a6ff",
  "magenta": "#a371f7",
  "cyan": "#39c5cf",
  "white": "#e6edf3",
  "brightBlack": "#8b949e"
}

Type "fastapi-url --help"
Enter
Sleep 600ms

Type "fastapi-url serve --port 8000"
Enter
Sleep 1s

Type "curl -X POST http://localhost:8000/api/shorten -H 'Content-Type: application/json' -d '{\"url\": \"https://github.com/BartoszOsiej\"}'"
Enter
Sleep 1s

Type "curl http://localhost:8000/api/stats"
Enter
Sleep 1s

Type "# JWT auth · click tracking · React dashboard"
Enter
Sleep 500ms
