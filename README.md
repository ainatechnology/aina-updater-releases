# aina-updater Releases

Official releases of **aina-updater** – the macOS Application Update Manager by AINA Technology GmbH.

## 📥 Download

### Latest Release: v0.1.0-beta

| Platform | Architecture | Download |
|----------|--------------|----------|
| macOS | Apple Silicon (M1/M2/M3) | [aina-updater-v0.1.0-beta-macos-arm64.zip](https://github.com/aina-technology/aina-updater-releases/releases/download/v0.1.0-beta/aina-updater-v0.1.0-beta-macos-arm64.zip) |
| macOS | Intel (x86_64) | [aina-updater-v0.1.0-beta-macos-x64.zip](https://github.com/aina-technology/aina-updater-releases/releases/download/v0.1.0-beta/aina-updater-v0.1.0-beta-macos-x64.zip) |

👉 [All Releases](https://github.com/aina-technology/aina-updater-releases/releases)

## 🚀 Installation

### Quick Install (Apple Silicon)

```bash
# Download
curl -LO https://github.com/aina-technology/aina-updater-releases/releases/latest/download/aina-updater-v0.1.0-beta-macos-arm64.zip

# Extract
unzip aina-updater-v0.1.0-beta-macos-arm64.zip

# Install (requires sudo)
sudo mv aina-updater /usr/local/bin/

# Verify installation
aina-updater --version
```

### Quick Install (Intel Mac)

```bash
# Download
curl -LO https://github.com/aina-technology/aina-updater-releases/releases/latest/download/aina-updater-v0.1.0-beta-macos-x64.zip

# Extract
unzip aina-updater-v0.1.0-beta-macos-x64.zip

# Install (requires sudo)
sudo mv aina-updater /usr/local/bin/

# Verify installation
aina-updater --version
```

### Using Homebrew (coming soon)

```bash
brew tap aina-technology/tap
brew install aina-updater
```

## ✨ Features

- 🔍 **Scan** installed applications and detect versions
- 🔄 **Check** for updates via Sparkle feeds, GitHub releases, Homebrew
- 📦 **Download & Install** updates automatically
- 🗑️ **Uninstall** apps with related files cleanup
- 🌐 **Web UI** for easy management
- ⚙️ **Custom feeds** for apps without auto-detection

## 📖 Quick Start

```bash
# Scan all installed apps
aina-updater scan

# Check for updates
aina-updater check-all

# Start Web UI
aina-updater serve
# Open http://localhost:3000
```

## 🔑 License

aina-updater includes a **90-day free trial** (beta) with full functionality.

After the trial period, a license is required for full features. Basic scanning remains free.

**Purchase a license:** https://aina.technology/updater

```bash
# Check license status
aina-updater license status

# Activate license
aina-updater license activate AINA-XXXX-XXXX-XXXX-XXXX
```

## 🔄 Self-Update

aina-updater can update itself:

```bash
# Check for updates
aina-updater self-update --check

# Perform update
aina-updater self-update
```

## 📋 System Requirements

- **OS:** macOS 12.0 (Monterey) or later
- **Architecture:** Apple Silicon (arm64) or Intel (x86_64)
- **Disk Space:** ~20 MB

## 🔐 Verification

All releases include SHA256 checksums. Verify your download:

```bash
# Download checksum file
curl -LO https://github.com/aina-technology/aina-updater-releases/releases/latest/download/SHA256SUMS.txt

# Verify
shasum -a 256 -c SHA256SUMS.txt
```

## 📞 Support

- **Website:** https://aina.technology
- **Documentation:** https://aina.technology/updater/docs
- **Email:** support@aina.technology
- **Issues:** https://github.com/aina-technology/aina-updater-releases/issues

## 📜 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

© 2026 AINA Technology GmbH • https://aina.technology
