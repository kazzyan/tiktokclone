class PostData {
  final String avatarImg;
  final String userName;
  final List<String> replyUsersImg;
  final String postTime;
  final String? text;
  final List<String>? postImg;
  final int replies;
  final int likes;
  final bool isCertified;

  PostData({
    required this.avatarImg,
    required this.userName,
    required this.replyUsersImg,
    required this.postTime,
    required this.text,
    required this.postImg,
    required this.replies,
    required this.likes,
    required this.isCertified,
  });
}

final postDataList = [];
