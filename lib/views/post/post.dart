import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktokclone/constants/svg_logo.dart';
import 'package:tiktokclone/models/post_model.dart';
import 'package:tiktokclone/views/post/post_item.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Center(
              child: SvgPicture.string(
                SvgLogo.svgString,
                height: 30,
              ),
            ),
            centerTitle: true,
            collapsedHeight: 100,
            expandedHeight: 200,
          ),
          SliverList.separated(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              var post = postList[index];
              return PostItem(
                item: post,
                isMine: false,
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
