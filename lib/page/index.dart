import 'package:flutter/material.dart';
import '../store/index.dart' show Store, CounterModel;
import 'home.dart';
import 'list.dart';
import 'about.dart';


class MainAPP extends StatefulWidget {
  @override
  createState() => new MainAPPState();
}

class MainAPPState extends State<MainAPP> {
  int _selectedIndex = 0;
  final List<Widget> tabBodies = [
    MainPage(),
    ListPage(),
    AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.format_align_justify), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('About')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
      body: IndexedStack(
              index: _selectedIndex,
              children: tabBodies,
            ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
    Store.value<CounterModel>(context).increment();
  } 
}