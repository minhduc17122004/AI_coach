import 'package:hive/hive.dart';
import '../dtos/user_dto.dart';

part 'user_hive_adapter.g.dart';

@HiveType(typeId: 0)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? photoUrl;

  @HiveField(4)
  final String createdAt;

  UserHiveModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.createdAt,
  });

  /// Convert from DTO
  factory UserHiveModel.fromDto(UserDto dto) => UserHiveModel(
        id: dto.id,
        name: dto.name,
        email: dto.email,
        photoUrl: dto.photoUrl,
        createdAt: dto.createdAt,
      );

  /// Convert to DTO
  UserDto toDto() => UserDto(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
        createdAt: createdAt,
      );
}
