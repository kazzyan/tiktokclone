import 'package:flutter/material.dart';
import 'package:tiktokclone/models/activity_model.dart';
import 'package:tiktokclone/views/activity/shared/activity_list_tile.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({
    super.key,
    required this.list,
  });

  final List<ActivityModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ActivityListTile(
          userInfo: list[index],
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
      ),
    );
  }
}
