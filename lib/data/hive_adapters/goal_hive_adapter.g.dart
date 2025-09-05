// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalHiveModelAdapter extends TypeAdapter<GoalHiveModel> {
  @override
  final int typeId = 1;

  @override
  GoalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalHiveModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      title: fields[2] as String,
      categoryString: fields[3] as String,
      targetMetric: fields[4] as String,
      startDate: fields[5] as String,
      targetDate: fields[6] as String,
      statusString: fields[7] as String,
      createdAt: fields[8] as String,
      updatedAt: fields[9] as String,
      isDeleted: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GoalHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.categoryString)
      ..writeByte(4)
      ..write(obj.targetMetric)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.targetDate)
      ..writeByte(7)
      ..write(obj.statusString)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
