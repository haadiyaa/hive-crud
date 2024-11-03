import 'package:flutter/material.dart';
import 'package:hive_crud/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyProvider extends ChangeNotifier {
  List<ModelClass> list = [];

  List<ModelClass> getAllData() {
    Box<ModelClass> box = Hive.box<ModelClass>('hivebox');
    list = box.values.toList();
    notifyListeners();
    print('get');
    return list;
  }

  Future<void> insert(ModelClass model) async {
    Box<ModelClass> box = Hive.box<ModelClass>('hivebox');
    await box.add(model);
    getAllData();
    print('added');
  }

  Future<void> update(ModelClass model, int index) async {
    Box<ModelClass> box = Hive.box<ModelClass>('hivebox');
    await box.putAt(index, model);
    getAllData();
    print('updated');
  }
}
