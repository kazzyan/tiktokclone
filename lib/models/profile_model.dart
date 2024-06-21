import 'package:tiktokclone/constants/img_list.dart';
import 'package:tiktokclone/models/post_model.dart';

final threadList = [
  PostModel(
    userName: "passion",
    avatarImg: ImgList.img1,
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text:
        "Give @cheeez_ a follow if you want to see more orange tabby or ginger cat content!",
  ),
  PostModel(
    userName: "fashion",
    avatarImg: ImgList.img6,
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "happy sunday🎈",
    postImg: [ImgList.img5],
  ),
  PostModel(
    userName: "gnar",
    avatarImg: ImgList.img5,
    isCertified: false,
    postTime: "1h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "AGREE",
    quote: {
      "account": "ruble.cat",
      "avatarImg": ImgList.img4,
      "text": "All CATS ARE CUTE",
      "postModelPostModelImg": ImgList.img3,
      "replies": 74,
    },
  ),
];

final replyList = [
  PostModel(
    userName: "yummychubby",
    avatarImg: ImgList.img2,
    isCertified: false,
    postTime: "5h",
    likes: 0,
    replies: 0,
    replyUsersImg: [],
    text: "ALL TREATS",
    quote: {
      "account": "aboutmeow",
      "avatarImg": ImgList.img1,
      "text": "What is your favorite flavored treat?",
      "postModelPostModelImg": ImgList.img6,
      "replies": 256,
    },
    reply: {
      "account": "gnar",
      "avatarImg": ImgList.img4,
      "time": "5h",
      "text": "Definetely!!!😻🥩🍖🍤",
    },
  )
];
