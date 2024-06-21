import 'package:tiktokclone/constants/img_list.dart';

class UserModel {
  UserModel({
    required this.userAccount,
    required this.userName,
    required this.followerCount,
    required this.profileImg,
    required this.isCertified,
  });

  final String userAccount;
  final String userName;
  final String profileImg;
  final int followerCount;
  final bool isCertified;
}

final userList = [
  UserModel(
    userAccount: "pubity",
    userName: "Pubity",
    followerCount: 5121049,
    profileImg: ImgList.img1,
    isCertified: true,
  ),
  UserModel(
    userAccount: "selenagomez",
    userName: "SelenaGomez",
    followerCount: 15239105,
    profileImg: ImgList.img2,
    isCertified: true,
  ),
  UserModel(
    userAccount: "voguekorea",
    userName: "VOGUE KOREA",
    followerCount: 412589,
    profileImg: ImgList.img3,
    isCertified: true,
  ),
  UserModel(
    userAccount: "wkorea",
    userName: "W Korea",
    followerCount: 294112,
    profileImg: ImgList.img4,
    isCertified: true,
  ),
  UserModel(
    userAccount: "doodledogsclub",
    userName: "Doodledogsclub",
    followerCount: 60141,
    profileImg: ImgList.img5,
    isCertified: false,
  ),
  UserModel(
    userAccount: "nala_cat",
    userName: "Nala Cat ™",
    followerCount: 281597,
    profileImg: ImgList.img6,
    isCertified: false,
  ),
];
