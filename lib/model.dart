
import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class ModelClass {

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String name;

  ModelClass({this.id, required this.name});
}
