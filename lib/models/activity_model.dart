import 'package:tiktokclone/constants/img_list.dart';
import 'package:tiktokclone/views/activity/shared/activity_type.dart';

class ActivityModel {
  ActivityModel({
    required this.account,
    required this.profileImg,
    required this.type,
    required this.time,
    required this.text,
    required this.post,
  });

  final String account;
  final String profileImg;
  final ActivityType type;
  final String time;
  final String text;
  final String post;
}

final activityList = [
  ActivityModel(
    account: "cheeez_",
    profileImg: ImgList.img1,
    type: ActivityType.mention,
    time: "4h",
    text: "Here's a thread you should follow if you love cat @gnar",
    post: "hello",
  ),
  ActivityModel(
    account: "cheeez_",
    profileImg: ImgList.img2,
    type: ActivityType.reply,
    time: "4h",
    text: "Count me in!",
    post: "Starting out my gardening club with threads❤",
  ),
  ActivityModel(
    account: "ruble.cat",
    profileImg: ImgList.img3,
    type: ActivityType.like,
    time: "5h",
    text: "",
    post: "✨🎇🎆",
  ),
  ActivityModel(
    account: "ruble.cat",
    profileImg: ImgList.img4,
    type: ActivityType.like,
    time: "5h",
    text: "",
    post: "happy sunday🎈",
  ),
  ActivityModel(
    account: "do_odle",
    profileImg: ImgList.img5,
    type: ActivityType.follow,
    time: "5h",
    text: "",
    post: "hello",
  ),
];
