// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_message_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoachMessageHiveModelAdapter extends TypeAdapter<CoachMessageHiveModel> {
  @override
  final int typeId = 3;

  @override
  CoachMessageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoachMessageHiveModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      roleString: fields[2] as String,
      content: fields[3] as String,
      createdAt: fields[4] as String,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      isDeleted: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CoachMessageHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.roleString)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.metadata)
      ..writeByte(6)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoachMessageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
