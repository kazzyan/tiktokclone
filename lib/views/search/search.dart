import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/models/user_model.dart';
import 'package:tiktokclone/views/post/cert_icon.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.size32,
                ),
              ),
              centerTitle: false,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverUserSearchTextField(),
            ),
            SliverList.separated(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                var user = userList[index];
                return ListTile(
                  leading: Column(
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                          user.profileImg,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  title: Row(
                    children: [
                      Text(
                        user.userAccount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.hor4,
                      const CertIcon(),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.userName,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gaps.ver4,
                      Text(
                        "${user.followerCount} followers",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
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
                      "Follow",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverUserSearchTextField extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size4,
        vertical: Sizes.size10,
      ),
      color: Colors.white,
      child: const CupertinoSearchTextField(),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
