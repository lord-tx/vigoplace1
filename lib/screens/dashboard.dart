import 'package:flutter/material.dart';
import 'package:vigoplace1/screens/pages/addPage.dart';
import 'package:vigoplace1/screens/pages/homePage.dart';
import 'package:vigoplace1/screens/pages/profilePage.dart';
import 'package:vigoplace1/screens/pages/searchPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int selectedIndex = 0;
  List<String> tempList = ["Boom"];

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    AddPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromRGBO(129, 53, 249, 1),
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12)
              ),
              child: Icon(Icons.home, )
            ),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12)
              ),
              child: Icon(Icons.search)
            ),
            label: "search"
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12)
              ),
              child: const Icon(Icons.add)
            ),
            label: "add"
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Container(),),
            label: "profile"
          ),
        ],
      ),
      appBar: AppBar(
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Hero(
            tag: "logo",
            child: Image.asset("assets/images/logo.png")
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12)
            ),
            child: GestureDetector(
              onTap: (){},
              child: const Icon(Icons.account_balance_wallet_outlined)
            )
          )
        ],
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
