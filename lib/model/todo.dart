import 'package:uuid/uuid.dart';

class TodoModel {
  TodoModel(this.name, {this.isDone = false}) : id = Uuid().v4();

  final String id;
  final String name;
  bool isDone;
}
