import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

import 'add.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  _UpdateTaskState createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  int get = lst.length;
  TextEditingController txt = TextEditingController();
  String gettext = "";

  update() {
    setState(() {
      lst.insert(get, gettext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: [
          SizedBox(
            width: 400,
            height: 600,
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              child: Column(children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 300),
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(120),
                          borderSide: const BorderSide(
                              width: 4, style: BorderStyle.none))),
                  autofocus: true,
                  controller: txt,
                  onChanged: (value) {
                    get = value as int;
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(120),
                        borderSide: const BorderSide(
                            width: 4, style: BorderStyle.none))),
                onChanged: (a) {
                  gettext = a;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  txt.clear();
                  update();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const My_App()));
                },
                child: const Text('Update')),
          ]))
        ],
      ),
    );
  }
}
