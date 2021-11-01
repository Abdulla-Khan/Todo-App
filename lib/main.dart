// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:todo_app/add.dart';
import 'package:todo_app/update.dart';

import 'delete.dart';

void main() {
  runApp(const My_App());
}

class My_App extends StatelessWidget {
  const My_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          SizedBox(
            width: 400,
            height: 600,
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.contain,
            ),
          ),
          const Positioned(
            child: Text(
              "Tasks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollcontianer) {
              return Stack(clipBehavior: Clip.none, children: <Widget>[
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task No ${index + 1}",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            lst[index],
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          trailing: const Icon(Icons.check_circle,
                              color: Colors.greenAccent),
                          isThreeLine: true,
                        );
                      },
                      controller: scrollcontianer,
                      itemCount: lst.length,
                    )),
                Positioned(
                  child: FloatingActionButton(
                    child: const Icon(Icons.add, size: 20, color: Colors.white),
                    backgroundColor: Colors.pinkAccent,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AddTask(),
                        ),
                      );
                    },
                  ),
                  top: -10,
                  right: 30,
                ),
                Positioned(
                  child: FloatingActionButton(
                    child:
                        const Icon(Icons.delete, color: Colors.white, size: 20),
                    backgroundColor: Colors.pinkAccent,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RemoveTask(),
                        ),
                      );
                    },
                  ),
                  top: -10,
                  right: 100,
                ),
                Positioned(
                  child: FloatingActionButton(
                    child: const Icon(Icons.upgrade,
                        color: Colors.white, size: 20),
                    backgroundColor: Colors.pinkAccent,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const UpdateTask(),
                        ),
                      );
                    },
                  ),
                  top: -10,
                  right: 170,
                )
              ]);
            },
          )
        ]));
  }
}
