// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesModelAdapter extends TypeAdapter<NotesModel> {
  @override
  final int typeId = 1;

  @override
  NotesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesModel(
      workOrder: fields[0] as String,
      date: fields[1] as String,
      wordOR: fields[2] as String,
      empName: fields[3] as String,
      empID: fields[4] as String,
      empDesignation: fields[5] as String,
      email: fields[6] as String,
      phone: fields[7] as String,
      depart: fields[8] as String,
      requestType: fields[9] as String,
      description: fields[10] as String,
      userId: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.workOrder)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.wordOR)
      ..writeByte(3)
      ..write(obj.empName)
      ..writeByte(4)
      ..write(obj.empID)
      ..writeByte(5)
      ..write(obj.empDesignation)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.depart)
      ..writeByte(9)
      ..write(obj.requestType)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
