import 'package:flutter/material.dart';
import 'package:hive_crud/model.dart';
import 'package:hive_crud/myprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    // final provider = Provider.of<MyProvider>(context, listen: false);
    // provider.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: name,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final provider =
                          Provider.of<MyProvider>(context, listen: false);
                      provider.insert(ModelClass(name: name.text));
                      name.clear();
                    },
                    child: Text('add'),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<MyProvider>(
        builder: (context, value, child) {
          // final provider = Provider.of<MyProvider>(context, listen: false);
          var list = value.getAllData();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(value.list[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: name,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    value.update(
                                        ModelClass(name: name.text), index);
                                    name.clear();
                                  },
                                  child: Text('update'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
