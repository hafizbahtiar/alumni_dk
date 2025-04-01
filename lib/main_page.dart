import 'package:flutter/material.dart';
import 'package:alumni_dk/routes/bottom_view.dart';
import 'package:alumni_dk/routes/drawer_view.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _pages = [
      HomePage(scaffoldKey: scaffoldKey),
      const Center(child: Text('Events')),
      const Center(child: Text('Network')),
      const Center(child: Text('Messages')),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Animate to the selected page when a tab is tapped
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: _pages,
      ),
      drawer: const DrawerView(),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomView(currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
