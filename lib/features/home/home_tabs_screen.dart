import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reddit_challenge/config/app_theme.dart';
import 'package:reddit_challenge/core/constants.dart';
import 'package:reddit_challenge/features/home/screens/chat/presentation/screen/chat_screen.dart';
import 'package:reddit_challenge/features/home/screens/communities/presentation/screen/communities_screen.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/screen/home_screen.dart';
import 'package:reddit_challenge/features/home/screens/inbox/presentation/screen/inbox_screen.dart';

class HomeTapsScreen extends StatefulWidget {
  const HomeTapsScreen({super.key});

  @override
  State<HomeTapsScreen> createState() => _HomeTapsScreenState();
}

class _HomeTapsScreenState extends State<HomeTapsScreen> {
  int _selectedIndex = 0;
  //to select the current page of the bottom navigation

  _selecatPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    if (_selectedIndex == 1) {
      activePage = const CommunitiesScreen();
    } else if (_selectedIndex == 2) {
    } else if (_selectedIndex == 3) {
      activePage = const ChatScreen();
    } else if (_selectedIndex == 4) {
      activePage = const InboxScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomNavigation(context),
      body: SafeArea(child: activePage),
    );
  }

  BottomNavigationBar _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.shifting,
      selectedLabelStyle: _getSelectedLabelStyle(),
      unselectedLabelStyle: _getUnSelectedLabelStyle(),
      unselectedItemColor: grayColor,
      items: [
        _buildBottomNavigationItem("Home", homeSolidIcon, homeLineIcon),
        _buildBottomNavigationItem(
            "Communities", communitiesSolidIcon, communitiesLineIcon),
        _buildBottomNavigationItem("Create", createLineIcon, createLineIcon),
        _buildBottomNavigationItem("Chat", chatSolidIcon, chatLineIcon),
        _buildBottomNavigationItem("Inbox", inboxSolidIcon, inboxLineIcon),
      ],
      onTap: (index) {
        _selecatPage(index);
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem(
      String title, String selectedAsset, String unselectedAsset) {
    return BottomNavigationBarItem(
        backgroundColor: Colors.black,
        icon: SvgPicture.asset(
          unselectedAsset,
          height: 26,
          colorFilter: const ColorFilter.mode(grayColor, BlendMode.srcIn),
        ),
        label: title,
        activeIcon: SvgPicture.asset(
          selectedAsset,
          height: 26,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ));
  }

  TextStyle _getSelectedLabelStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _getUnSelectedLabelStyle() {
    return const TextStyle(
      decorationColor: grayColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }
}
