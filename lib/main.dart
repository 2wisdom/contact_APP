import 'package:flutter/material.dart';

void main() {
  // runApp : 앱 시작해주세요~
  runApp(MyApp());
}

// state 위젯 만들기: `stful`
// state가 필요한 부분 : 자주 바뀌는 데이터들, 바뀌면 바로바로 보여야하는 데이터들
// setState(() { callback })


// 위젯 만들기: `stless`
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['콩깍지', '내언니', '내엄마', '내아빠'];

  @override
  Widget build(BuildContext context) {
    // 실제 코딩
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i){
              return ListTile(
                leading: Image.asset('profile.jpg'),
                title: Text(name[i])
              );
            },
        )
        )
    );
  }
}


class BottomAppBar extends StatelessWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.call, color: Colors.blue),
            label: 'call',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.green),
            label: 'message'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_page, color: Colors.pink),
            label: 'contact'
        )
      ],
    );
  }
}
