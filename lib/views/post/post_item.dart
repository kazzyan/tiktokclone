import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/models/post_model.dart';
import 'package:tiktokclone/views/post/cert_icon.dart';
import 'package:tiktokclone/views/post/ellipsis_bottom_sheep.dart';
import 'package:tiktokclone/views/post/post_item_img_slider.dart';
import 'package:tiktokclone/views/post/post_item_reply_user.dart';
import 'package:tiktokclone/views/post/post_item_user_avatar.dart';

class PostItem extends StatefulWidget {
  const PostItem({
    super.key,
    required this.item,
    required this.isMine,
  });

  final PostModel item;
  final bool isMine;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late PageController _pageController;
  bool _isLiked = false;
  bool _isRetweet = false;

  void _initController() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction:
          widget.item.postImg != null && widget.item.postImg!.length > 1
              ? 0.9
              : 1,
    );
  }

  void _onLikeTap() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _onRetweetTap() {
    setState(() {
      _isRetweet = !_isRetweet;
    });
  }

  void _onEllipsisTap(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context,
      builder: (context) => const EllipsisBottomSheet(),
      showDragHandle: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size12,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                PostItemUserAvatar(
                  avatarImg: widget.item.avatarImg,
                  isMine: widget.isMine,
                ),
                Gaps.ver10,
                if (!widget.isMine) ...[
                  const Expanded(
                    child: VerticalDivider(
                      thickness: Sizes.size2,
                      color: Colors.grey,
                    ),
                  ),
                  if (widget.item.replyUsersImg.isNotEmpty) ...[
                    Gaps.ver10,
                    PostItemReplyUser(
                      replyUsers: widget.item.replyUsersImg,
                    ),
                  ]
                ]
              ],
            ),
            Gaps.hor16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.item.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.hor4,
                      Opacity(
                        opacity: widget.item.isCertified ? 1 : 0,
                        child: const CertIcon(),
                      ),
                      const Spacer(),
                      Text(
                        widget.item.postTime,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Gaps.hor14,
                      GestureDetector(
                        onTap: widget.isMine
                            ? () {}
                            : () => _onEllipsisTap(context),
                        child: const FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: Sizes.size16,
                        ),
                      ),
                      Gaps.hor6,
                    ],
                  ),
                  Gaps.ver6,
                  Text(
                    widget.item.text ?? "",
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.ver10,
                  if (widget.item.postImg != null)
                    PostItemImgSlider(
                      postImg: widget.item.postImg!,
                      controller: _pageController,
                    ),
                  if (widget.item.quote != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(
                          Sizes.size14,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: Sizes.size12,
                                foregroundImage: NetworkImage(
                                    widget.item.quote!["avatarImg"]!),
                              ),
                              Gaps.hor10,
                              Text(
                                widget.item.quote!["account"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                            ],
                          ),
                          Gaps.ver6,
                          if (widget.item.quote!["text"] != null)
                            Text(
                              widget.item.quote!["text"]!,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          if (widget.item.quote!["postImg"] != null) ...[
                            Gaps.ver10,
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size14,
                                ),
                              ),
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Image(
                                  image: NetworkImage(
                                      widget.item.quote!["postImg"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gaps.ver10,
                          ],
                          Text(
                            "${widget.item.quote!["replies"]!} replies",
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: _onLikeTap,
                          child: FaIcon(
                            _isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: Sizes.size20 + Sizes.size2,
                            color: _isLiked ? Colors.red : null,
                          ),
                        ),
                        Gaps.hor20,
                        const FaIcon(
                          FontAwesomeIcons.comment,
                          size: Sizes.size20 + Sizes.size2,
                        ),
                        Gaps.hor20,
                        GestureDetector(
                          onTap: _onRetweetTap,
                          child: FaIcon(
                            FontAwesomeIcons.retweet,
                            size: Sizes.size20 + Sizes.size2,
                            color: _isRetweet ? Colors.green : null,
                          ),
                        ),
                        Gaps.hor20,
                        const FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: Sizes.size20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size6,
                    ),
                    child: Text(
                      "${_isRetweet ? widget.item.replies + 1 : widget.item.replies} replies · ${_isLiked ? widget.item.likes + 1 : widget.item.likes} likes",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
