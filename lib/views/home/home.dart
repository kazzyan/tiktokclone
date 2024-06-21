import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/views/activity/activity.dart';
import 'package:tiktokclone/views/home/edit.dart';
import 'package:tiktokclone/views/post/post.dart';
import 'package:tiktokclone/views/profile/profile.dart';
import 'package:tiktokclone/views/search/search.dart';

import 'package:tiktokclone/views/home/shared/navigation_tab_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 3;

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const Post(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Search(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Edit(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Activity(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Profile(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigatonTabButton(
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () => _onNavTap(0),
              ),
              NavigatonTabButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onNavTap(1),
              ),
              NavigatonTabButton(
                icon: FontAwesomeIcons.solidPenToSquare,
                isSelected: _selectedIndex == 2,
                onTap: () => _onNavTap(2),
              ),
              NavigatonTabButton(
                icon: FontAwesomeIcons.heart,
                isSelected: _selectedIndex == 3,
                onTap: () => _onNavTap(3),
              ),
              NavigatonTabButton(
                icon: FontAwesomeIcons.user,
                isSelected: _selectedIndex == 4,
                onTap: () => _onNavTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
