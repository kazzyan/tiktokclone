import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/models/activity_model.dart';
import 'package:tiktokclone/views/activity/shared/activity_type.dart';

class ActivityListTile extends StatelessWidget {
  const ActivityListTile({
    super.key,
    required this.userInfo,
  });

  final ActivityModel userInfo;

  String _activityTypeText(ActivityType type) {
    if (type == ActivityType.mention) {
      return "Mentioned you";
    } else if (type == ActivityType.follow) {
      return "Followed you";
    } else {
      return userInfo.post;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        right: Sizes.size10,
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userInfo.profileImg),
                  backgroundColor: Colors.amber,
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(
                    Sizes.size4,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: userInfo.type.color,
                  ),
                  child: FaIcon(
                    userInfo.type.iconData,
                    size: Sizes.size10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      title: Row(
        children: [
          Text(
            userInfo.account,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.hor8,
          Text(
            userInfo.time,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            _activityTypeText(userInfo.type),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: Sizes.size16,
            ),
          ),
          if (userInfo.text != "")
            Text(
              userInfo.text,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
      trailing: userInfo.type == ActivityType.follow
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Sizes.size10,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Text(
                "Following",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            )
          : null,
    );
  }
}
