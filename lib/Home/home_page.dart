
import 'package:chatapplication/Home/profile_Screen.dart';
import 'package:chatapplication/Home/usersview_chat.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final tabs = [
    Profile(),
    usersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Color(0xffa8a7a4),
        body:tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // type: BottomNavigationBarType.fixed,

          selectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: ('Profile'),
              backgroundColor: Color(0xffDAD3C8),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: ('Chat'),
              backgroundColor: Color(0xffFFE5DE),

            ),

          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),





      ),
    );
  }
}
