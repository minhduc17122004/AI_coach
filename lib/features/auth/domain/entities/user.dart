import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id, // Firebase UID
    required String name,
    required String email,
    String? photoUrl,
    required DateTime createdAt,
  }) = _User;

  const User._();

  /// Get user initials for avatar
  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : 'U';
  }

  /// Check if user has profile photo
  bool get hasProfilePhoto => photoUrl != null && photoUrl!.isNotEmpty;
}
