import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  bool _isPrivacy = false;

  void _onPrivacyTap(bool value) {
    setState(() {
      _isPrivacy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
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
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            splashRadius: 0,
            value: _isPrivacy,
            onChanged: (value) => _onPrivacyTap(value),
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.lock,
                  size: Sizes.size20,
                  color: Colors.black,
                ),
                Gaps.hor24,
                Text(
                  "Privacy",
                ),
              ],
            ),
          ),
          const ListTile(
            minLeadingWidth: 25,
            leading: FaIcon(
              FontAwesomeIcons.twitter,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Mentions",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey,
                    height: 1.2,
                  ),
                ),
                Gaps.hor6,
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: Sizes.size20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bellSlash,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Muted",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Hidden Words",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userGroup,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Profiles you follow",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            title: Text(
              "Other privacy settings",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey,
              ),
            ),
            trailing: FractionallySizedBox(
              heightFactor: 1.6,
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: Sizes.size16,
                color: Colors.grey,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Blocked profiles",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCircleXmark,
              size: Sizes.size20,
              color: Colors.black,
            ),
            title: Text(
              "Hide likes",
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
