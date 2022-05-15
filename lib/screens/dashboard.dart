import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vigoplace1/screens/navPages/addPage.dart';
import 'package:vigoplace1/screens/navPages/homePage.dart';
import 'package:vigoplace1/screens/navPages/profilePage.dart';
import 'package:vigoplace1/screens/navPages/searchPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> tempList = ["Boom"];

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    AddPage(),
    ProfilePage()
  ];

  String defaultImageUrl = "https://s3-alpha-sig.figma.com/img/84b9/9884/8572cccd5607b2e036623e2e3c7f5a6b?Expires=1653264000&Signature=FlZoLaTQtWl5mNELyzvqowwSJwBNM9MflHZnLu-kaz4nMJCWqGOxltEHM490jsNMcuqsFGG1gXwJHRlsVsZQPmbI0Hy2zX~2bclsK3lcXqFAW~nyJDVFhcIGgQjUvYuUlp9cDyQ7fBI2Dbv9oYfCq9629h1TG~4uyZj2WlJj7YTaiA3r4rXEWH9VdnFaGd4eQGORZjyPVRAFzDarfGnY28PXuyrVLhOEYMuhEeXxnjWNDqhkW8~ENTfgaujSyBS8a-DzT-hsSkV~ySu4TTgB8zeFbTCP6sxlJYj2SIIRD4okgy8~Ik2MuLF0vl4n56vwXA1OwnAgPUFpRhMnCvejDA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
  DateTime? currentBackPressTime;

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
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromRGBO(129, 53, 249, 1),
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12)
              ),
              child: const Icon(Icons.home, )
            ),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12)
              ),
              child: const Icon(Icons.search)
            ),
            label: "search"
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(5),
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
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: Image.network(
                  defaultImageUrl,
                  errorBuilder: (context, object, trace){
                    return Image.asset("assets/images/default_post_image.png");
                  },
                ),
              ),),
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
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(10),
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
        child: WillPopScope(
          onWillPop: () async {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
              currentBackPressTime = now;
              Fluttertoast.showToast(msg: "Press back again to exit app",);
              return false;
            }
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return true;
          },
          child: PageView(
            controller: _pageController,
            children: pages
          ),
        ),
      ),
    );
  }
}
