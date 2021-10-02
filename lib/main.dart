// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(My_App());
}

class My_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
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
              return Stack(overflow: Overflow.visible, children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task No $index",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "This is the detail of Task No $index",
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          trailing: Icon(Icons.check_circle,
                              color: Colors.greenAccent),
                          isThreeLine: true,
                        );
                      },
                      controller: scrollcontianer,
                      itemCount: 10,
                    )),
                Positioned(
                  child: FloatingActionButton(
                    child: Icon(Icons.add, color: Colors.white),
                    backgroundColor: Colors.pinkAccent,
                    onPressed: () {},
                  ),
                  top: -10,
                  right: 30,
                )
              ]);
            },
          )
        ]));
  }
}
