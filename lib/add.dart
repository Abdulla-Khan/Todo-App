import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

List lst = [];

class _AddTaskState extends State<AddTask> {
  String get = '';
  TextEditingController txt = TextEditingController();
  submit() {
    setState(() {
      lst.add(get);
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
            child: Column(
              children: [
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
                        get = value;
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit();
                      txt.clear();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const My_App(),
                        ),
                      );
                    },
                    child: const Text('Submit')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
