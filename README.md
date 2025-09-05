# 🧑‍🏫 AI Coach App (Flutter + Firebase + Hive)

Ứng dụng **AI Coach** giúp bạn đặt mục tiêu, theo dõi thói quen và nhận tư vấn cá nhân hoá từ AI.  
Được xây dựng bằng **Flutter**, kết hợp **Firebase** (Auth, Firestore, Messaging) và **Hive** (offline-first).

---

## ✨ Tính năng chính (MVP)

- 🔐 **Xác thực người dùng**: Đăng nhập bằng Google/Email (Firebase Auth).  
- 🎯 **Quản lý mục tiêu (Goals)**: Tạo, chỉnh sửa, xoá, theo dõi tiến độ.  
- ✅ **Nhiệm vụ hàng ngày (Tasks)**: Danh sách việc cần làm, đánh dấu hoàn thành, streak.  
- 📅 **Kế hoạch (Plan)**: Sinh lộ trình 7 ngày bằng AI, hiển thị lịch tuần.  
- 🤖 **Coach Chat**: Chat với AI để được tư vấn hoặc tinh chỉnh kế hoạch.  
- 🔔 **Thông báo (Notifications)**: Nhắc việc bằng local notifications + push (FCM).  
- 📊 **Báo cáo tiến độ**: Biểu đồ, streak, phần trăm hoàn thành.  
- 📴 **Offline-first**: Dữ liệu lưu bằng Hive, đồng bộ Firestore khi online.

---

## 🛠 Công nghệ & Thư viện

- **Flutter 3.22+** (Material 3, Responsive UI)  
- **State management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc), [freezed](https://pub.dev/packages/freezed)  
- **Firebase**: Auth, Firestore, Analytics, Messaging, Storage  
- **Hive**: Local database (offline-first) + encryption key với flutter_secure_storage  
- **Networking**: Dio (gọi API backend AI)  
- **Router**: go_router (deep linking + shell navigation)  
- **Notification**: flutter_local_notifications + FCM  
- **Chart**: fl_chart  
- **Testing**: flutter_test, golden_toolkit  

---

## 📂 Kiến trúc thư mục

