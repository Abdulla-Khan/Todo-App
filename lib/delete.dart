import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

import 'add.dart';

class RemoveTask extends StatefulWidget {
  const RemoveTask({Key? key}) : super(key: key);

  @override
  _RemoveTaskState createState() => _RemoveTaskState();
}

class _RemoveTaskState extends State<RemoveTask> {
  int get = 0;
  TextEditingController txt = TextEditingController();
  remove() {
    setState(() {
      lst.removeAt(get);
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
            ElevatedButton(
                onPressed: () {
                  remove();
                  txt.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const My_App()));
                },
                child: const Text('Remove')),
          ]))
        ],
      ),
    );
  }
}
