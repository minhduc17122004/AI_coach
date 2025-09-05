// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskHiveModelAdapter extends TypeAdapter<TaskHiveModel> {
  @override
  final int typeId = 2;

  @override
  TaskHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskHiveModel(
      id: fields[0] as String,
      goalId: fields[1] as String,
      userId: fields[2] as String,
      title: fields[3] as String,
      description: fields[4] as String,
      date: fields[5] as String,
      estimatedMinutes: fields[6] as int,
      statusString: fields[7] as String,
      completionNote: fields[8] as String?,
      createdAt: fields[9] as String,
      updatedAt: fields[10] as String,
      isDeleted: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goalId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.estimatedMinutes)
      ..writeByte(7)
      ..write(obj.statusString)
      ..writeByte(8)
      ..write(obj.completionNote)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
