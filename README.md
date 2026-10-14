# NOIR Music Player

NOIR Music Player v0.4.0 — a white-and-black-first Windows desktop music player project with outlined panels, local music import, a persistent library, playlists, ten themes, a 180+ family font catalogue, a custom CSS theme editor, searchable song metadata matching, and editable keyboard shortcuts, artist profiles, searchable artist portraits, song assignment, a compact global search dropdown, and GitHub-release in-app updates.

> **Build status:** Source project created and JavaScript syntax-checked. A Windows installer has not been built in this environment because dependency installation did not finish here. Run the setup commands below on a Windows PC with internet access to fetch dependencies and create the installer. The updater needs your real GitHub owner/repository values before release.

## What's new in v0.4.0

- Added an in-app updater based on `electron-updater` and GitHub Releases for installed Windows NSIS builds. It checks on launch (unless disabled), downloads available updates in the background, shows progress in Settings → Behavior & access, and offers a Restart & install button after download.
- Added a compact global music-search dropdown. It shows up to seven matching songs with cover, title, artist, album and duration; click a result to play it. Use the Up/Down arrows, Enter and Escape while the search box is focused.
- Artist portrait lookup now starts while typing into the artist-name field. Select the correct online artist result to fill the name and cache its available portrait; no manual image upload is required when a usable picture is found. Artist profile song assignment remains separate and user-controlled.
- Version is now 0.4.0.

## Important: configure the GitHub updater before releasing

The GitHub owner is a placeholder in `package.json`. Before you build the first public installer, replace `YOUR_GITHUB_USERNAME` with your GitHub username and make sure the repository name is `NOIR-Music-Player` (or update both the repository URL and `build.publish.repo` to your actual public repository). The app will display a setup-required status while the placeholder remains. You only need to configure the repository owner once per source checkout.

The auto-updater supports installed Windows **NSIS** builds; it does not update a copy launched with `npm start`. The v0.3.0 builds were created before the update feed was configured, so users already running v0.3.0 need to install v0.4.0 once manually. Future versions can update from within NOIR without manually downloading every new installer, provided each update is published correctly.

To build the installer, run `npm run dist`; it will create the installer plus update metadata (such as `latest.yml` and a `.blockmap`) in `release`. Publish the installer, `latest.yml`, and the matching `.blockmap` as assets on a **published, non-draft GitHub Release** for the same version/tag. For future releases, increment `package.json`'s version, rebuild, and publish the new generated assets. Alternatively, set `GH_TOKEN` as an environment variable and use `npm run dist:publish`; never save a personal access token in the source tree.

## Publish an update so installed copies can update themselves

1. Replace the GitHub owner placeholder in `package.json`, create the public repository, and push the source.
2. Build v0.4.0 using `npm run dist` on Windows. Test the produced `NOIR-Music-Player-Setup-0.4.0.exe` on a clean Windows account if possible.
3. Publish a non-draft GitHub Release tagged `v0.4.0`. Upload the generated installer, `latest.yml`, and matching `.blockmap` from `release`. This is the first version with the updater feed; people on v0.3.0 must install it manually once.
4. For a future release, update the version in `package.json` (for example `0.4.1`), make your code changes, build again and publish the newly generated installer, `latest.yml`, and `.blockmap` to a published GitHub Release. Existing v0.4.0+ installs will discover and download it from Settings → Behavior & access (or automatically, if enabled).
5. You can automate publishing with `npm run dist:publish` by setting `GH_TOKEN` in the current terminal environment to a GitHub token with release permissions. Never hard-code a token in source files or commit it. Client installs do not need a token because releases are public.

Don't reuse a version number for a second build. The update service decides which build is newer from the version and release metadata.

## Features in this build

- When adding individual music files, a **Choose your song** dialog can search the public iTunes music catalog. Pick a result to fill the library title, artist, album, release year, track number, genre and cover art. The local audio file itself is not changed. Multiple selected files are handled one by one; folder imports remain bulk imports using each file’s existing tags. An internet connection is needed for catalog search and downloading cover art.
- Right-click a song for Play now, Play next, favorites, existing playlists, Create playlist, Show in folder, and Remove from library. Favorited hearts stay red across themes.
- The Artists page supports optional local pictures and live Wikipedia artist/band lookup from the artist-name field. Type a name and select the correct result to fill the artist name and cache its available portrait; choosing a local image is only an optional fallback. Profiles can be created/deleted and tracks assigned without modifying original audio tags. Right-click the Artists heading to open the artist-name search bar; right-click an artist card for profile actions. Artist image lookup requires internet access.
- The Settings window stays hidden until its saved theme has been applied, preventing an initial white flash, using a dual-readiness gate that waits for the renderer to apply its saved palette before showing the window. The compact sidebar keeps its expand control visible.
- Keyboard shortcuts are editable in Settings → Behavior & access. Click a binding, press the desired key combination, and save settings. Duplicate bindings are blocked; shortcuts work while the main NOIR window is focused and are not registered system-wide.
- Electron desktop shell with a separate Settings window, context isolation, disabled renderer Node integration, and sandbox enabled.
- White & Black is the default. Other palettes: Black & White, Crimson Red, Topaz Blue, Matte Dark, Coffee, Teal, Lavender, Forest Green, and Sunset Amber.
- Thin outlines and dividers, compact-sidebar option, recent listening, albums/artists pages, track search, favorites, libraries, playlists, and a playback queue.
- Import individual music files or scan folders. Metadata is read with `music-metadata` where supported, including embedded artwork. Original files remain in their existing folders.
- Common audio playback using Chromium's HTML audio engine, with play/pause, previous/next, seeking, volume, shuffle, repeat, and auto-advance.
- Typography browser with more than 180 family choices (Segoe UI is the Windows-first default) across sans-serif, serif, monospace, rounded, display, handwriting, and system groups.
- Ten theme palettes, border intensity, corner radius, density, reduced motion, text sizing, settings persistence, and live preview.
- Custom CSS editor with import/export and basic safety checks. It blocks `@import`, `url(...)`, remote font loading, CSS behavior hooks and script-like URL schemes. CSS is scoped toward the app interface and cannot execute JavaScript.

## Important limitations

- **Audio formats:** the app currently uses the browser's built-in audio engine. MP3, WAV, FLAC, OGG and compatible M4A/AAC files are typical starting points, but actual codec support depends on the Electron/Chromium build. The metadata reader may recognize more formats than the playback engine can play. This version does not yet bundle VLC/libVLC decoders.
- **Fonts:** the browser lists more than 180 font families. Fonts already installed on the user's system should work; families not installed will use a fallback until the user installs the desired font. This source package does not currently bundle 180 font files.
- The metadata chooser searches iTunes catalog results; the catalog will not contain every song or every release. Online lookup is optional in Settings. Font-file import, startup-with-Windows integration, and a full library folder watcher are not implemented yet. Embedded album artwork is supported when available.
- The UI uses a basic browser CSS syntax/safety filter for user snippets, not a full code-editor engine. CSS at-rules (such as `@media` and `@font-face`) and remote resources are intentionally blocked; use theme variables and ordinary selectors. If styling looks wrong, clear the custom CSS and restore the defaults.
- This is an early, source-level build. Run real playback/import tests before relying on it as a daily player.

## Requirements

- Windows 10 or Windows 11 (Windows is the target platform for packaging).
- Node.js and npm installed.
- Internet access during the first dependency install.

## Run the app from source

1. Extract the ZIP to a folder such as `C:\Users\<you>\Desktop\noir-music-player`.
2. Install Node.js if it is not already installed. You can double-click `run-noir.bat` to install dependencies and launch the source app, or open PowerShell in the folder.
3. Install dependencies:

   ```powershell
   npm install
   ```

4. Start the desktop app:

   ```powershell
   npm start
   ```

## Build a Windows installer

From the same folder, run:

```powershell
npm run dist
```

The installer should be produced in the `release` folder. Test the installer on Windows before sharing it with others.

## Project structure

```text
noir-music-player/
├── package.json
├── README.md
└── src/
    ├── main.cjs       # Electron main process and file-system operations
    ├── preload.cjs    # Narrow, validated IPC surface for the renderer
    ├── index.html     # Main music player window
    ├── styles.css     # Main window UI, outlines and theme variables
    ├── app.js         # Library, playlists, search and audio controls
    ├── settings.html  # Separate settings window
    ├── settings.css   # Settings layout and custom CSS editor styling
    └── settings.js    # Theme/font catalog, settings persistence UI
```

## Where data is stored

The library and settings are stored under Electron's `app.getPath('userData')` directory. The local UI state (favorites, playlists, recently played list, current collection and basic queue preferences) uses the application's local storage. Your imported music is referenced in place; removing a track from NOIR does not delete the original audio file.

## Basic acceptance test checklist

- Launch with `npm start`, then open Settings in a separate window.
- Switch among all ten themes and confirm both windows respond.
- Add one or more audio files; try searching the metadata chooser, select a match, and verify NOIR title/artist/album/artwork updates while the original file remains unchanged. Test Use file tags, no-results, and offline failure. Also test folder import stays bulk-friendly.
- Import a folder containing duplicates and confirm the duplicate preference behavior.
- Play, pause, seek, change volume, next/previous, shuffle, repeat, and test end-of-track behavior.
- Create a second library, create a playlist, add and remove tracks from it, then restart and confirm the data is retained. Test the global search dropdown by mouse and keyboard and confirm selecting a result starts playback.
- Test font search/category filters, change each keyboard shortcut and check duplicate rejection/reset/persistence, then test CSS preview, save, import/export, malformed CSS rejection, and clearing a custom snippet.
- Build the installer and verify the packaged app can open its saved music library. Test update discovery/download/install with two sequential published releases (for example 0.4.0 then 0.4.1) on an installed NSIS build.
