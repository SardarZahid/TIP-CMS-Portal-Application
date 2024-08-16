import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel extends HiveObject {
  @HiveField(0)
  late String workOrder;

  @HiveField(1)
  late String date;

  @HiveField(2)
  late String wordOR;
  
  @HiveField(3)
  late String empName;
  
  @HiveField(4)
  late String empID;
  
  @HiveField(5)
  late String empDesignation;

  @HiveField(6)
  late String email;
  
  @HiveField(7)
  late String phone;
  
  @HiveField(8)
  late String depart;
  
  @HiveField(9)
  late String requestType;
  
  @HiveField(10)
  late String description;

  @HiveField(11)
  late String userId;

  NotesModel({
    required this.workOrder,
    required this.date,
    required this.wordOR,
    required this.empName,
    required this.empID,
    required this.empDesignation,
    required this.email,
    required this.phone,
    required this.depart,
    required this.requestType,
    required this.description,
    required this.userId,
  });
}
