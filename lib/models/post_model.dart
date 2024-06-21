import 'package:tiktokclone/constants/img_list.dart';

class PostModel {
  final String avatarImg;
  final String userName;
  final List<String> replyUsersImg;
  final String postTime;
  final String? text;
  final List<String>? postImg;
  final int replies;
  final int likes;
  final bool isCertified;
  final Map<String, dynamic>? quote;
  final Map<String, dynamic>? reply;

  PostModel({
    required this.userName,
    required this.avatarImg,
    required this.isCertified,
    required this.postTime,
    required this.likes,
    required this.replies,
    required this.replyUsersImg,
    this.quote,
    this.postImg,
    this.text,
    this.reply,
  });
}

final postList = [
  PostModel(
    userName: "pubity",
    avatarImg: ImgList.img1,
    isCertified: true,
    postTime: "2m",
    likes: 391,
    replies: 36,
    replyUsersImg: [
      ImgList.img2,
      ImgList.img3,
      ImgList.img4,
    ],
    text:
        "Good morning Thriends ☀️ Let’s share some pictures and fun facts about our pets below 😍",
    postImg: [
      ImgList.img5,
    ],
  ),
  PostModel(
    userName: "selenagomez",
    avatarImg: ImgList.img6,
    isCertified: true,
    postTime: "3m",
    likes: 80000,
    replies: 21685,
    replyUsersImg: [
      ImgList.img1,
      ImgList.img2,
      ImgList.img3,
    ],
    text:
        "Y’all have been asking for new music for a while. Since I’m not quite done with SG3, I wanted to put out a fun little song I wrote a while back that’s perfect for the end of summer. SINGLE SOON. August 25th. Presave it now. 😘",
    postImg: [
      ImgList.img4,
      ImgList.img5,
    ],
  ),
];
