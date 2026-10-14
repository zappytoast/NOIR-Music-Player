# Changelog

## 0.4.0 — In-app updates, artist autocomplete and music search

- Integrated `electron-updater` for GitHub Releases updates on installed Windows NSIS builds, with automatic startup checks, download progress, a user-triggered check and a Restart & install action.
- Added a visible update status panel under Settings → Behavior & access, plus an automatic-check preference.
- Added guardrails for development builds and placeholder GitHub configuration so the UI explains why updates are unavailable.
- Changed artist lookup to run as the user types in the artist/band name field; choosing an online result fills the name and caches an available profile portrait automatically. Local image selection is presented only as an optional fallback.
- Added a compact global song-search dropdown with album art, title, artist, album and duration, plus keyboard navigation and direct play by clicking a result.
- Incremented the application version to 0.4.0 and documented GitHub Release asset requirements.

## 0.3.0 — Artist profiles and interaction fixes

- Added right-click song actions for playing, queueing, favoriting, adding to any existing playlist, and creating a playlist directly from the menu.
- Updated the favorite heart to red in song rows, the playback dock, the context menu, and the Favorites navigation icon when at least one song is favorited.
- Completed the artist profile editor layout for optional local photos, online Wikipedia artist/band search, and selecting specific tracks from the music library.
- Added/retained artist card context actions for editing, choosing a picture, viewing associated songs, and deleting a profile without deleting audio files.
- Made saved artist song assignments authoritative so deselecting a track from a profile is respected.
- Preserved artist image source and credit metadata when opening and saving profiles.
- Kept the Settings window hidden until its native frame and first themed renderer paint are ready, preventing the initial white flash.
- Kept the compact-sidebar expand button visible and reachable.
- Removed orphaned artist-manager CSS and an unused settings variable.
- Added static checks for context menus, artist search, profile save recovery, Escape behavior, image fallback behavior, and required UI IDs.
- Made artist profile saves, image updates and profile deletion roll back in-memory state if persistence fails.
- Escape now closes the artist editor as well as standard dialogs, and duplicate image-fallback code was removed.

## Verification

- `node --check` passes for `src/app.js`, `src/main.cjs`, `src/preload.cjs`, and `src/settings.js`.
- `npm run test:static` passes.
- Duplicate HTML ID and direct event-listener target checks pass.
- A Windows installer and a full Electron runtime test were not completed in this environment.
