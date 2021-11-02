import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MyApp> {
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
                      add();
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
                      delete();
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
                      edit();
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

  String get = '';
  List lst = [];
  int num = 0;
  TextEditingController txt = TextEditingController();
  submit() {
    setState(() {
      lst.add(get);
    });
  }

  remove() {
    setState(() {
      lst.removeAt(num);
    });
  }

  update() {
    setState(() {
      lst.insert(num, get);
    });
  }

  add() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              TextField(
                controller: txt,
                onChanged: (value) {
                  get = value;
                },
              ),
              SimpleDialogOption(
                child: const Text('Hellwo'),
                onPressed: () {
                  submit();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
            ],
          );
        });
  }

  edit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              TextField(
                controller: txt,
                onChanged: (value) {
                  num = value as int;
                },
              ),
              TextField(
                controller: txt,
                onChanged: (value) {
                  get = value;
                },
              ),
              SimpleDialogOption(
                child: const Text('Hellwo'),
                onPressed: () {
                  update();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
            ],
          );
        });
  }

  delete() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              TextField(
                controller: txt,
                onChanged: (value) {
                  num = value as int;
                },
              ),
              SimpleDialogOption(
                child: const Text('Hellwo'),
                onPressed: () {
                  remove();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
            ],
          );
        });
  }
}
