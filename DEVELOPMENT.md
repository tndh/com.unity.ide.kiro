# Development Guide

## Regenerating GUIDs

Package Kiro được thiết kế để cùng tồn tại với package Windsurf mà không xung đột GUID.

### Khi nào cần regenerate GUIDs?

- Khi fork từ package khác (như Windsurf, VSCode, etc.)
- Khi muốn tạo package mới từ template này
- Khi gặp GUID conflicts với package khác

### Cách regenerate GUIDs

Chạy script PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File regenerate-guids.ps1
```

Script sẽ:
1. Tìm tất cả file `.meta` trong project
2. Tạo GUID mới cho mỗi file
3. Cập nhật file với GUID mới
4. Hiển thị log chi tiết

### Sau khi regenerate

1. Commit tất cả thay đổi vào Git
2. Test package trong Unity project
3. Đảm bảo không có GUID conflicts

## Package Structure

```
com.unity.ide.kiro/
├── Editor/                          # Editor scripts
│   ├── VisualStudioKiroInstallation.cs  # Main integration
│   ├── Discovery.cs                 # Auto-discovery logic
│   ├── ProjectGeneration/           # .csproj generation
│   ├── Messaging/                   # Unity-Editor communication
│   └── Testing/                     # Test runner integration
├── Documentation~/                  # Documentation files
├── package.json                     # Package manifest
├── README.md                        # User documentation
├── INSTALLATION.md                  # Installation guide
├── TROUBLESHOOTING.md              # Troubleshooting guide
├── MIGRATION.md                     # Migration/coexistence guide
└── regenerate-guids.ps1            # GUID regeneration script
```

## Key Files

### VisualStudioKiroInstallation.cs

Main integration class that:
- Detects Kiro installations on Windows/macOS/Linux
- Opens files in Kiro with correct line numbers
- Creates `.vscode/` configuration files
- Manages project generation

### Discovery.cs

Handles auto-discovery of Kiro installations:
- Searches common installation paths
- Validates executable files
- Returns installation metadata

### Assembly Definition

`Editor/com.unity.ide.visualstudio.asmdef`:
- Assembly name: `Unity.Kiro.Editor`
- Must be unique to avoid conflicts

## Testing

### Manual Testing

1. Install package in Unity project
2. Check if Kiro appears in External Tools dropdown
3. Test opening scripts from Unity
4. Verify IntelliSense works
5. Test debugging functionality

### Test with Windsurf

1. Install both packages
2. Verify no GUID conflicts
3. Switch between editors
4. Test both work independently

## Platform-Specific Notes

### Windows

- Primary paths:
  - `%LOCALAPPDATA%\Programs\Kiro\Kiro.exe`
  - `C:\Program Files\Kiro\Kiro.exe`
  - `C:\Program Files (x86)\Kiro\Kiro.exe`
- Multi-drive search:
  - Automatically scans all fixed drives (C:, D:, E:, etc.)
  - Checks `[Drive]:\Program Files\Kiro\Kiro.exe`
  - Checks `[Drive]:\Program Files (x86)\Kiro\Kiro.exe`
- Uses `.exe` extension
- Supports custom installation paths via manual selection

### macOS

- Default path: `/Applications/Kiro.app`
- Uses `.app` bundle format
- Requires special open command

### Linux

- Paths: `/usr/bin/kiro`, `/bin/kiro`, `/usr/local/bin/kiro`
- Checks XDG desktop files
- May need symlink resolution

## Customization

### Adding New Editor Support

To add support for another editor (e.g., "MyEditor"):

1. Copy `VisualStudioKiroInstallation.cs` to `VisualStudioMyEditorInstallation.cs`
2. Update class name and installation paths
3. Update `Discovery.cs` to include new class
4. Update assembly name in `.asmdef`
5. Run `regenerate-guids.ps1`
6. Update `package.json` with new name

### Modifying Detection Logic

Edit `IsCandidateForDiscovery()` method to change:
- File name patterns
- Installation paths
- Version detection

## Release Process

1. Update version in `package.json`
2. Update `CHANGELOG.md`
3. Test on all platforms
4. Commit and tag release
5. Push to repository

## Support

For development questions:
- Check Unity Package Manager documentation
- Review Unity CodeEditor API
- See existing Visual Studio Code integration
