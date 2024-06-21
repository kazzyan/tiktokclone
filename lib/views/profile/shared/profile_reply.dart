import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/views/post/post_item_user_avatar.dart';

class ProfileReply extends StatelessWidget {
  final Map<String, dynamic> replyInfo;

  const ProfileReply({
    super.key,
    required this.replyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostItemUserAvatar(
          avatarImg: replyInfo["avatarImg"],
          isMine: true,
        ),
        Gaps.hor16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    replyInfo["account"],
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    replyInfo["time"],
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Gaps.hor14,
                  const FaIcon(
                    FontAwesomeIcons.ellipsis,
                    size: Sizes.size16,
                  ),
                  Gaps.hor6,
                ],
              ),
              Gaps.ver6,
              Text(
                replyInfo["text"],
                style: const TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
