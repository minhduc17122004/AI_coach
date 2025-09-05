import 'package:json_annotation/json_annotation.dart';
import '../../features/auth/domain/entities/user.dart';

part 'user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserDto {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String createdAt;

  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  /// Convert DTO to Domain Entity
  User toEntity() => User(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
        createdAt: DateTime.parse(createdAt),
      );

  /// Create DTO from Domain Entity
  factory UserDto.fromEntity(User user) => UserDto(
        id: user.id,
        name: user.name,
        email: user.email,
        photoUrl: user.photoUrl,
        createdAt: user.createdAt.toIso8601String(),
      );

  /// Create DTO for Firestore (with server timestamp)
  Map<String, dynamic> toFirestore() => {
        'id': id,
        'name': name,
        'email': email,
        'photo_url': photoUrl,
        'created_at': createdAt,
      };

  /// Create DTO from Firestore document
  factory UserDto.fromFirestore(Map<String, dynamic> data, String documentId) {
    return UserDto(
      id: documentId,
      name: data['name'] as String,
      email: data['email'] as String,
      photoUrl: data['photo_url'] as String?,
      createdAt: data['created_at'] as String,
    );
  }
}
