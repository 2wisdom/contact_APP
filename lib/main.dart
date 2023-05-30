import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyState extends StatefulWidget {
  const MyState({Key? key}) : super(key: key);

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List name = ['백설기', '백설탕', '이우디'];
  var inputData = TextEditingController();

  addContact() {
    setState(() {
      name.add(inputData.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("전화번호부")),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('profile.jpeg'),
            title: Text(name[i]),
          );
        },
      ),
      bottomNavigationBar: BottomMenu(),
      floatingActionButton: FloatingActionButton(
          child: Text("+"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogUI(
                      inputData: inputData, name: name, addContact: addContact);
                });
          }),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.call),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ],
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.inputData, this.name, this.addContact})
      : super(key: key);
  final inputData;
  final addContact;
  final name;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 300,
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Contact",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
          TextField(
            controller: inputData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  inputData.clear();
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  addContact();
                  inputData.clear();
                  Navigator.pop(context, true);
                },
                child: Text("OK"),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
