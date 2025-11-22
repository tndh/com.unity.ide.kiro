# Sử dụng Kiro cùng với Windsurf

## ✅ Tin tốt: Không cần Migration!

Package Kiro (`com.unity.ide.kiro`) được thiết kế để **cùng tồn tại** với package Windsurf (`com.unity.ide.windsurf`). Bạn có thể:

- Cài đặt cả hai package cùng lúc
- Chuyển đổi giữa Kiro và Windsurf bất cứ lúc nào
- Không cần gỡ package cũ
- Không có xung đột GUID

## Cài đặt song song

### Bước 1: Cài đặt Kiro (giữ nguyên Windsurf)

1. Mở Unity Editor
2. Vào **Window** → **Package Manager**
3. Click **"+"** → **"Add package from git URL..."**
4. Nhập: `https://github.com/YOUR_USERNAME/com.unity.ide.kiro.git`
5. Click **"Add"**

### Bước 2: Chọn editor mặc định

1. Vào **Edit** → **Preferences** (Windows/Linux) hoặc **Unity** → **Preferences** (macOS)
2. Chọn **External Tools**
3. Trong dropdown **External Script Editor**, bạn sẽ thấy cả hai:
   - **Kiro**
   - **Windsurf**
4. Chọn editor bạn muốn sử dụng
5. Click **"Regenerate project files"**

## Chuyển đổi giữa các editor

Bạn có thể chuyển đổi bất cứ lúc nào:

1. **Edit** → **Preferences** → **External Tools**
2. Chọn editor khác trong dropdown
3. Click **"Regenerate project files"**
4. Double-click vào script để mở với editor mới

## Gỡ Windsurf (Tùy chọn)

Nếu bạn muốn chỉ dùng Kiro và gỡ Windsurf:

### Cách 1: Qua Package Manager

1. Mở Unity Editor
2. Vào **Window** → **Package Manager**
3. Tìm package **"Windsurf Editor"**
4. Click vào package đó
5. Click nút **"Remove"**

### Cách 2: Chỉnh sửa manifest.json

1. Đóng Unity Editor
2. Mở file `Packages/manifest.json` trong project
3. Tìm và xóa dòng:
   ```json
   "com.unity.ide.windsurf": "..."
   ```
4. Lưu file
5. Mở lại Unity Editor

## Lợi ích của việc giữ cả hai

- **Linh hoạt**: Chuyển đổi giữa các editor dễ dàng
- **So sánh**: Test tính năng của cả hai editor
- **Backup**: Luôn có editor dự phòng
- **Team work**: Các thành viên team có thể dùng editor khác nhau

## Xử lý vấn đề

### Không thấy Kiro/Windsurf trong dropdown

**Giải pháp:**
1. Đảm bảo editor đã được cài đặt trên máy
2. Plugin tự động tìm kiếm ở nhiều vị trí (bao gồm tất cả ổ đĩa)
3. Nếu vẫn không thấy, click nút **"Browse..."** và chọn thủ công:
   - **Kiro Windows**: 
     - `%LOCALAPPDATA%\Programs\Kiro\Kiro.exe`
     - `C:\Program Files\Kiro\Kiro.exe`
     - `D:\Program Files\Kiro\Kiro.exe` (hoặc ổ đĩa khác)
   - **Windsurf Windows**: `%LOCALAPPDATA%\Programs\windsurf\windsurf.exe`
   - **Kiro macOS**: `/Applications/Kiro.app`
   - **Windsurf macOS**: `/Applications/Windsurf.app`
   - **Kiro Linux**: `/usr/bin/kiro`, `/usr/local/bin/kiro`

### IntelliSense không hoạt động

**Giải pháp:**
1. Trong Unity: **Edit** → **Preferences** → **External Tools**
2. Đảm bảo đã chọn đúng editor
3. Click **"Regenerate project files"**
4. Đóng và mở lại editor
5. Trong editor, reload window: Ctrl+Shift+P → "Developer: Reload Window"

### Project files bị lỗi khi chuyển đổi

**Giải pháp:**
1. Xóa các file `.csproj` và `.sln` trong project root
2. Trong Unity: **Edit** → **Preferences** → **External Tools**
3. Click **"Regenerate project files"**

## Hỗ trợ

Nếu gặp vấn đề, xem:
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Hướng dẫn khắc phục sự cố
- [INSTALLATION.md](INSTALLATION.md) - Hướng dẫn cài đặt chi tiết
- GitHub Issues - Báo cáo lỗi hoặc yêu cầu hỗ trợ
