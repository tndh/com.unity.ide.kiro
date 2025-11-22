# Khắc phục sự cố

## ✅ Kiro và Windsurf có thể cùng tồn tại

Package Kiro được thiết kế để **không xung đột** với Windsurf. Bạn có thể cài đặt cả hai và chuyển đổi tự do.

Nếu bạn vẫn gặp lỗi GUID conflict, có thể bạn đang dùng phiên bản cũ của package. Hãy cập nhật lên phiên bản mới nhất.

## Cập nhật package Kiro

### Từ Git URL

1. Mở **Window** → **Package Manager**
2. Tìm package **"Kiro Editor"**
3. Click vào package đó
4. Nếu có nút **"Update"**, click để cập nhật
5. Hoặc gỡ và cài lại từ Git URL

### Kiểm tra phiên bản

Đảm bảo bạn đang dùng phiên bản 1.0.0 trở lên, phiên bản này đã có GUID độc lập.

## Kiro không được phát hiện

**Plugin tự động tìm kiếm Kiro ở các vị trí sau:**

### Windows
- `%LOCALAPPDATA%\Programs\Kiro\Kiro.exe`
- `C:\Program Files\Kiro\Kiro.exe`
- `C:\Program Files (x86)\Kiro\Kiro.exe`
- `D:\Program Files\Kiro\Kiro.exe`
- `E:\Program Files\Kiro\Kiro.exe`
- Và tất cả các ổ đĩa cố định khác

Kiểm tra bằng lệnh:
```cmd
dir "%LOCALAPPDATA%\Programs\Kiro\Kiro.exe"
dir "C:\Program Files\Kiro\Kiro.exe"
dir "D:\Program Files\Kiro\Kiro.exe"
```

### macOS
- `/Applications/Kiro.app`

Kiểm tra bằng lệnh:
```bash
ls -la /Applications/Kiro.app
```

### Linux
- `/usr/bin/kiro`
- `/bin/kiro`
- `/usr/local/bin/kiro`

Kiểm tra bằng lệnh:
```bash
which kiro
```

**Giải pháp nếu không tự động phát hiện:**

1. Đảm bảo Kiro đã được cài đặt đúng
2. Trong Unity: **Edit** → **Preferences** → **External Tools**
3. Click nút **"Browse..."** bên cạnh **External Script Editor**
4. Chọn file `Kiro.exe` thủ công (ví dụ: `D:\Program Files\Kiro\Kiro.exe`)
5. Unity sẽ nhớ đường dẫn này cho lần sau

**Lưu ý:** Plugin tự động quét tất cả ổ đĩa cố định, nhưng nếu Kiro ở vị trí đặc biệt, bạn cần chọn thủ công.

## IntelliSense không hoạt động

1. Trong Unity: **Edit** → **Preferences** → **External Tools**
2. Đảm bảo **Kiro** được chọn làm External Script Editor
3. Click **"Regenerate project files"**
4. Đóng và mở lại Kiro
5. Trong Kiro, mở Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
6. Chạy lệnh: **"Developer: Reload Window"**

## Project files không được tạo

1. Kiểm tra quyền ghi file trong thư mục project
2. Xóa các file `.csproj` và `.sln` cũ
3. Trong Unity: **Edit** → **Preferences** → **External Tools**
4. Click **"Regenerate project files"**

## Debugging không hoạt động

1. Đảm bảo extension Unity cho Kiro đã được cài đặt
2. Kiểm tra file `.vscode/launch.json` đã được tạo
3. Trong Kiro, mở Debug panel (Ctrl+Shift+D / Cmd+Shift+D)
4. Chọn configuration **"Attach to Unity"**
5. Nhấn F5 để bắt đầu debugging

## Liên hệ hỗ trợ

Nếu vẫn gặp vấn đề, vui lòng:
1. Mở issue trên GitHub repository
2. Cung cấp thông tin:
   - Phiên bản Unity
   - Hệ điều hành
   - Phiên bản Kiro
   - Log lỗi đầy đủ từ Unity Console
