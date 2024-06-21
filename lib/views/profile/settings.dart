import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/views/profile/privacy.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _onPrivacyTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Privacy(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            children: [
              Gaps.hor16,
              FaIcon(
                FontAwesomeIcons.angleLeft,
                size: Sizes.size20,
              ),
              Gaps.hor8,
              Text(
                "Back",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 80,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: Text(
                "Follow and invite friends",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: Text(
                "Notifications",
              ),
            ),
            ListTile(
              onTap: () => _onPrivacyTap(context),
              leading: const FaIcon(
                FontAwesomeIcons.lock,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: const Text(
                "Privacy",
              ),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.user,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: Text(
                "Account",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.hand,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: Text(
                "Help",
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleInfo,
                size: Sizes.size20,
                color: Colors.black,
              ),
              title: Text(
                "About",
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 0,
                      backgroundColor: Colors.grey,
                      title: const Text(
                        "Would you like to log out of the Threads?",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                      actions: [
                        Column(
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Log out",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
