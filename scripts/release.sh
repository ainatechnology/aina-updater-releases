#!/bin/bash
#
# aina-updater Release Script
# Usage: ./release.sh <version>
# Example: ./release.sh 0.1.0-beta
#

set -e

VERSION="${1:-0.1.0-beta}"
PROJECT_DIR="/Volumes/AINA/app-updater"  # Anpassen!
OUTPUT_DIR="./releases/v${VERSION}"

echo "🚀 Building aina-updater v${VERSION}"
echo "========================================"

# Prüfe ob Projekt-Verzeichnis existiert
if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Project directory not found: $PROJECT_DIR"
    exit 1
fi

cd "$PROJECT_DIR"

# Output-Verzeichnis erstellen
mkdir -p "$OUTPUT_DIR"

echo ""
echo "📦 Building for Apple Silicon (arm64)..."
cargo build --release --target aarch64-apple-darwin 2>/dev/null || {
    echo "ℹ️  Adding target aarch64-apple-darwin..."
    rustup target add aarch64-apple-darwin
    cargo build --release --target aarch64-apple-darwin
}

echo ""
echo "📦 Building for Intel (x86_64)..."
cargo build --release --target x86_64-apple-darwin 2>/dev/null || {
    echo "ℹ️  Adding target x86_64-apple-darwin..."
    rustup target add x86_64-apple-darwin
    cargo build --release --target x86_64-apple-darwin
}

echo ""
echo "📁 Packaging releases..."

# ARM64
ARM64_BIN="target/aarch64-apple-darwin/release/aina-updater"
ARM64_ZIP="aina-updater-v${VERSION}-macos-arm64.zip"
if [ -f "$ARM64_BIN" ]; then
    cp "$ARM64_BIN" "$OUTPUT_DIR/aina-updater"
    cd "$OUTPUT_DIR"
    zip -q "$ARM64_ZIP" aina-updater
    rm aina-updater
    cd "$PROJECT_DIR"
    echo "✅ Created: $ARM64_ZIP"
else
    echo "⚠️  ARM64 binary not found"
fi

# x86_64
X64_BIN="target/x86_64-apple-darwin/release/aina-updater"
X64_ZIP="aina-updater-v${VERSION}-macos-x64.zip"
if [ -f "$X64_BIN" ]; then
    cp "$X64_BIN" "$OUTPUT_DIR/aina-updater"
    cd "$OUTPUT_DIR"
    zip -q "$X64_ZIP" aina-updater
    rm aina-updater
    cd "$PROJECT_DIR"
    echo "✅ Created: $X64_ZIP"
else
    echo "⚠️  x86_64 binary not found"
fi

echo ""
echo "🔐 Generating checksums..."
cd "$OUTPUT_DIR"

# SHA256 Checksums erstellen
shasum -a 256 *.zip > SHA256SUMS.txt
echo "✅ Created: SHA256SUMS.txt"

cat SHA256SUMS.txt

echo ""
echo "📋 Updating latest.json..."

# Checksums extrahieren
ARM64_SHA=$(grep "arm64" SHA256SUMS.txt | cut -d' ' -f1)
X64_SHA=$(grep "x64" SHA256SUMS.txt | cut -d' ' -f1)
ARM64_SIZE=$(stat -f%z "$ARM64_ZIP" 2>/dev/null || stat --printf="%s" "$ARM64_ZIP")
X64_SIZE=$(stat -f%z "$X64_ZIP" 2>/dev/null || stat --printf="%s" "$X64_ZIP")

# latest.json erstellen
cat > latest.json << EOF
{
  "version": "${VERSION}",
  "release_date": "$(date +%Y-%m-%d)",
  "release_notes_url": "https://github.com/aina-technology/aina-updater-releases/releases/tag/v${VERSION}",
  "min_os_version": "12.0",
  "downloads": {
    "macos-arm64": {
      "url": "https://github.com/aina-technology/aina-updater-releases/releases/download/v${VERSION}/${ARM64_ZIP}",
      "sha256": "${ARM64_SHA}",
      "size_bytes": ${ARM64_SIZE}
    },
    "macos-x64": {
      "url": "https://github.com/aina-technology/aina-updater-releases/releases/download/v${VERSION}/${X64_ZIP}",
      "sha256": "${X64_SHA}",
      "size_bytes": ${X64_SIZE}
    }
  },
  "changelog": [
    "See release notes for details"
  ],
  "urgent": false,
  "min_version": null
}
EOF

echo "✅ Created: latest.json"

cd "$PROJECT_DIR"

echo ""
echo "========================================"
echo "✅ Release v${VERSION} ready!"
echo ""
echo "📁 Files in: $OUTPUT_DIR"
ls -la "$OUTPUT_DIR"
echo ""
echo "📝 Next steps:"
echo "   1. Go to https://github.com/aina-technology/aina-updater-releases/releases/new"
echo "   2. Tag: v${VERSION}"
echo "   3. Title: aina-updater v${VERSION}"
echo "   4. Upload files from: $OUTPUT_DIR"
echo "   5. Copy latest.json to repository root"
echo ""
