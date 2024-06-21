import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/models/activity_model.dart';
import 'package:tiktokclone/views/activity/shared/activity_list_view.dart';
import 'package:tiktokclone/views/activity/shared/activity_type.dart';
import 'package:tiktokclone/views/activity/shared/persistent_tab_bar.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 5,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> activitiesTab = [
      "All",
      "Replies",
      "Mentions",
      "Follows",
      "Likes",
    ];

    final replies = activityList
        .where((element) => element.type == ActivityType.reply)
        .toList();
    final mentions = activityList
        .where((element) => element.type == ActivityType.mention)
        .toList();
    final follows = activityList
        .where((element) => element.type == ActivityType.follow)
        .toList();
    final likes = activityList
        .where((element) => element.type == ActivityType.like)
        .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                title: Text(
                  "Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.size32,
                  ),
                ),
                centerTitle: false,
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(
                  controller: _tabController,
                  tabs: activitiesTab,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              ActivityListView(list: activityList),
              ActivityListView(list: replies),
              ActivityListView(list: mentions),
              ActivityListView(list: follows),
              ActivityListView(list: likes),
            ],
          ),
        ),
      ),
    );
  }
}
