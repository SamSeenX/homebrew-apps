# Homebrew Apps Tap

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-macOS-blue.svg)]()

> The official Homebrew tap for SamSeen's applications and tools.

This repository allows macOS users to easily install and update my tools using the Homebrew package manager.

## ✨ Available Formulae

| Tool | Description | Install Command |
|------|-------------|-----------------|
| **📦 DiskMan** | Enhanced Disk Space Analyzer | `brew install SamSeenX/apps/diskman` |
| **🖼️ IMP** | Image Optimizer CLI Tool | `brew install SamSeenX/apps/imp` |

## 🚀 Quick Start

### Installation

To add this tap and install tools:

```bash
# Add the tap
brew tap SamSeenX/apps

# Install tools
brew install diskman
brew install imp
```

Or install directly in one line:

```bash
brew install SamSeenX/apps/diskman
brew install SamSeenX/apps/imp
```

### Updating

To update installed tools:

```bash
brew update
brew upgrade diskman imp
```

## 📖 Documentation

### What is a Tap?

A "tap" is a third-party repository for Homebrew that extends the list of available packages. This repo contains the formulae (installation scripts) for my software.

## 🏗️ Project Structure

```
homebrew-apps/
├── Formula/          # Homebrew formulae
│   ├── diskman.rb    # DiskMan formula
│   └── imp.rb        # IMP Image Optimizer formula
└── README.md
```

## 🤝 Contributing

Contributions (to update formulae) are welcome!

## 📝 License

This project is licensed under the MIT License.

## ☕ Support

If you find these tools useful, please consider supporting me:

- ⭐ Starring this repository
- ☕ [Buy me a coffee](https://buymeacoffee.com/samseen)

---

Created with ❤️ by [SamSeen](https://buymeacoffee.com/samseen)