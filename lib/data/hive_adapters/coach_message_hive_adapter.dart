import 'package:hive/hive.dart';
import '../dtos/coach_message_dto.dart';

part 'coach_message_hive_adapter.g.dart';

@HiveType(typeId: 3)
class CoachMessageHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String roleString;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final String createdAt;

  @HiveField(5)
  final Map<String, dynamic>? metadata;

  @HiveField(6)
  final bool isDeleted;

  CoachMessageHiveModel({
    required this.id,
    required this.userId,
    required this.roleString,
    required this.content,
    required this.createdAt,
    this.metadata,
    required this.isDeleted,
  });

  /// Convert from DTO
  factory CoachMessageHiveModel.fromDto(CoachMessageDto dto) =>
      CoachMessageHiveModel(
        id: dto.id,
        userId: dto.userId,
        roleString: dto.roleString,
        content: dto.content,
        createdAt: dto.createdAt,
        metadata: dto.metadata,
        isDeleted: dto.isDeleted,
      );

  /// Convert to DTO
  CoachMessageDto toDto() => CoachMessageDto(
        id: id,
        userId: userId,
        roleString: roleString,
        content: content,
        createdAt: createdAt,
        metadata: metadata,
        isDeleted: isDeleted,
      );
}
