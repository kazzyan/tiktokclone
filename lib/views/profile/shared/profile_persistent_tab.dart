import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class ProfilePersistentTabBar extends SliverPersistentHeaderDelegate {
  ProfilePersistentTabBar({
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: controller,
        splashFactory: NoSplash.splashFactory,
        dividerColor: Colors.grey,
        indicatorWeight: 1.2,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black.withOpacity(0.8),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 46.0;

  @override
  double get minExtent => 46.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
