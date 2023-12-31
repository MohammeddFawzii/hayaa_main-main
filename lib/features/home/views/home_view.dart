import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/Utils/app_colors.dart';
import '../../games/views/games_view.dart';
import '../../messages/views/messages_view.dart';
import '../../profile/views/profile_view.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = 'HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 2;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  List<Widget> views = [
    ProfileView(),
    const MessagesView(),
    const HomeViewBody(),
    const GamesView(),
  ];
  List<Icon> iconList = [
    const Icon(Icons.menu, color: Colors.white, size: 60),
    const Icon(Icons.message_rounded, color: Colors.white, size: 60),
    const Icon(Icons.home_outlined, color: Colors.white, size: 60),
    const Icon(Icons.games, color: Colors.white, size: 60),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      //________________________________

      body: SafeArea(child: views[currentIndex]),

      //________________________________________________

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8E24AA),
              Color(0xFF673AB7)
            ], // Example gradient colors
          ),
        ),
        child: CurvedNavigationBar(
          height: 60,
          key: _bottomNavigationKey,
          letIndexChange: (index) => true,
          index: currentIndex,
          animationCurve: Curves.easeInOut,
          color: AppColors.appInformationColors400,
          buttonBackgroundColor: AppColors.appPrimaryColors500,
          backgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            getIcon(0),
            getIcon(1),
            getIcon(2),
            getIcon(3),
          ],
        ),
      ),
    );
  }

  Widget getIcon(int index) {
    return Icon(
      iconList[index].icon,
      size: currentIndex == index ? 40 : 20,
      color: iconList[index].color,
    );
  }
}
