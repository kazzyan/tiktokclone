import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/img_list.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/views/post/post_item.dart';
import 'package:tiktokclone/views/profile/settings.dart';
import 'package:tiktokclone/views/profile/shared/profile_button.dart';
import 'package:tiktokclone/views/profile/shared/profile_persistent_tab.dart';
import 'package:tiktokclone/views/profile/shared/profile_reply.dart';
import 'package:tiktokclone/models/profile_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  void _onMenuTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Settings(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              leading: Container(
                padding: const EdgeInsets.only(
                  left: Sizes.size16,
                ),
                alignment: Alignment.centerLeft,
                child: const FaIcon(
                  FontAwesomeIcons.globe,
                ),
              ),
              actions: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size6,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        size: Sizes.size28,
                      ),
                    ),
                    Gaps.hor14,
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _onMenuTap,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: Sizes.size16,
                        ),
                        height: Sizes.size28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: Sizes.size2,
                              width: Sizes.size24,
                              color: Colors.black,
                            ),
                            Gaps.ver8,
                            Container(
                              height: Sizes.size2,
                              width: Sizes.size14,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                  horizontal: Sizes.size12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gaps.ver8,
                            const Text(
                              "Passion",
                              style: TextStyle(
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Gaps.ver14,
                            Row(
                              children: [
                                const Text(
                                  "passion",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.hor10,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size8,
                                    vertical: Sizes.size4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size14,
                                    ),
                                  ),
                                  child: const Text(
                                    "flutter.com",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: Sizes.size12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gaps.ver16,
                            const Text(
                              "I love flutter",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: Sizes.size36,
                          backgroundColor: Colors.black,
                          foregroundImage: NetworkImage(ImgList.img3),
                        ),
                      ],
                    ),
                    Gaps.ver16,
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                Sizes.size1,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                radius: Sizes.size12,
                                foregroundImage: NetworkImage(ImgList.img4),
                              ),
                            ),
                            Positioned(
                              right: -16,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  Sizes.size1,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: const CircleAvatar(
                                  radius: Sizes.size12,
                                  foregroundImage: NetworkImage(ImgList.img5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.hor28,
                        const Text(
                          "2 followers",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    Gaps.ver16,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ProfileButton(
                            text: "Edit profile",
                          ),
                        ),
                        Gaps.hor8,
                        Flexible(
                          flex: 1,
                          child: ProfileButton(
                            text: "Share profile",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProfilePersistentTabBar(
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size12,
              ),
              child: ListView.separated(
                itemCount: threadList.length,
                itemBuilder: (context, index) {
                  return PostItem(
                    item: threadList[index],
                    isMine: true,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: Sizes.size1,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: ListView.builder(
                itemCount: replyList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostItem(
                        item: replyList[index],
                        isMine: false,
                      ),
                      ProfileReply(replyInfo: replyList[index].reply!),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
