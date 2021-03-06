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
                            leading: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.greenAccent,
                              ),
                              onPressed: () {
                                delete();
                              },
                            ),
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
                            trailing: IconButton(
                                icon: const Icon(Icons.update,
                                    color: Colors.greenAccent),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                  label:
                                                      Text("Update Your Task"),
                                                  hintText: "Anything",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .pinkAccent))),
                                              autofocus: true,
                                              controller: txt1,
                                              onChanged: (value) {
                                                upd1 = value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                FloatingActionButton(
                                                  child:
                                                      const Icon(Icons.update),
                                                  onPressed: () {
                                                    setState(() {
                                                      lst[index] = upd1;
                                                    });
                                                    txt1.clear();
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop(HomePage());
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                }));
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
                  right: 60,
                ),
              ]);
            },
          )
        ]));
  }

  String upd1 = "";
  String get = '';
  int getint = 0;
  List lst = [];
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();

  submit() {
    setState(() {
      lst.add(get);
    });
  }

  remove() {
    setState(() {
      lst.removeAt(getint);
    });
  }

  add() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            children: [
              TextField(
                decoration: InputDecoration(
                    label: Text("Add Task"),
                    hintText: "Anything",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.pinkAccent))),
                autofocus: true,
                controller: txt,
                onChanged: (value) {
                  get = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    elevation: 8,
                    child: const Icon(Icons.add, color: Colors.black),
                    onPressed: () {
                      submit();
                      txt.clear();

                      Navigator.of(context, rootNavigator: true)
                          .pop(HomePage());
                    },
                  ),
                ],
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
              Title(
                  color: Colors.black,
                  child: const Center(
                    child: Text('Are you sure!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  )),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.delete),
                    onPressed: () {
                      remove();
                      txt.clear();
                      Navigator.of(context, rootNavigator: true)
                          .pop(HomePage());
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
