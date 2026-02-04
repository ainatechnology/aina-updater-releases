# Changelog

All notable changes to aina-updater will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0-beta] - 2026-01-31

### 🎉 Initial Beta Release

First public beta release of aina-updater.

### Added

- **App Scanning**
  - Scan `/Applications` and `~/Applications` for installed apps
  - Extract version info from Info.plist
  - Detect installation source (App Store, Homebrew, Direct)

- **Update Sources**
  - Sparkle/AppCast XML feed support
  - GitHub Releases integration
  - Homebrew Cask version checking
  - Custom feed configuration per app

- **Update Management**
  - Check single app or all apps for updates
  - Download updates with progress display
  - Install DMG, ZIP, and PKG files
  - Automatic backup before installation

- **Uninstall**
  - Remove apps with related files (caches, preferences, etc.)
  - Interactive mode for file selection
  - Dry-run mode for preview
  - Ignore patterns for protected paths

- **Web UI**
  - Dashboard with statistics
  - App list with filters
  - Problem detection view
  - Dark/Light mode toggle

- **Configuration**
  - TOML-based config file
  - CLI commands for settings
  - Per-app overrides

- **Licensing**
  - 90-day beta trial period
  - License key activation
  - Feature gating after trial

### Technical

- Built with Rust for performance and safety
- SQLite database for caching and state
- REST API for Web UI
- Cross-platform ready (macOS first)

---

## Upcoming

### [0.2.0] - Planned

- Self-update functionality
- Homebrew tap installation
- Scheduled update checks
- Notification support

---

[0.1.0-beta]: https://github.com/aina-technology/aina-updater-releases/releases/tag/v0.1.0-beta
