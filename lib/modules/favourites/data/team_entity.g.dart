// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamEntityAdapter extends TypeAdapter<TeamEntity> {
  @override
  final int typeId = 0;

  @override
  TeamEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      logo: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeamEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
