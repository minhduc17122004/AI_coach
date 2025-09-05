// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_snapshot_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgressSnapshotHiveModelAdapter
    extends TypeAdapter<ProgressSnapshotHiveModel> {
  @override
  final int typeId = 4;

  @override
  ProgressSnapshotHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressSnapshotHiveModel(
      id: fields[0] as String,
      goalId: fields[1] as String,
      date: fields[2] as String,
      doneTasks: fields[3] as int,
      totalTasks: fields[4] as int,
      streak: fields[5] as int,
      createdAt: fields[6] as String,
      isDeleted: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressSnapshotHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goalId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.doneTasks)
      ..writeByte(4)
      ..write(obj.totalTasks)
      ..writeByte(5)
      ..write(obj.streak)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressSnapshotHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
