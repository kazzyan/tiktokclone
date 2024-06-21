import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class PostItemImgSlider extends StatelessWidget {
  const PostItemImgSlider({
    super.key,
    required this.postImg,
    required this.controller,
  });

  final List<String> postImg;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        padEnds: false,
        controller: controller,
        itemCount: postImg.length,
        itemBuilder: (context, index) {
          var img = postImg[index];
          return Container(
            margin: EdgeInsets.only(
              right: index != postImg.length - 1 ? Sizes.size10 : 0,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Sizes.size14,
              ),
            ),
            child: Image(
              image: NetworkImage(
                img,
              ),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
