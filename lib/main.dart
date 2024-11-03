import 'package:flutter/material.dart';
import 'package:hive_crud/homepage.dart';
import 'package:hive_crud/model.dart';
import 'package:hive_crud/myprovider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelClassAdapter());
  await Hive.openBox<ModelClass>('hivebox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
