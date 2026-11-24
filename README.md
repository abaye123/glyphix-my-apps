# my-apps

Hebrew launcher for the DT G1 watch. It takes the Wooden Fish slot (`com.xfaith.woodenfish`, AppID 0xC82C) and opens three free packages with `@system.launch`:

- `com.abaye.music` (music-player)
- `com.abaye.reader` (text-reader)
- `com.abaye.whosewatch` (whose-watch)

Each of them must be in `gui/apps/<package>.pkg` and registered in `gui/pkgs.db`.

Build: `gx build -d dtg1-c175r -f`, with the Glyphix CLI `bin` folder on `PATH`.

Icons: `.\tools\render-icon.ps1 -OutDir (Resolve-Path src\assets)`. The music and whose-watch icons are copies from those apps.

## License

Personal, non-commercial use. Anything you share that is based on this project must be published as open source under the same license. Commercial use requires prior written permission. See [LICENSE](LICENSE).
