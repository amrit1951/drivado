import 'package:drivado/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/sizes.dart';

class MobBottom extends StatefulWidget {
  const MobBottom({super.key});

  @override
  State<MobBottom> createState() => _MobBottomState();
}

class _MobBottomState extends State<MobBottom> {
  var _showBottomBar = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _showBottomBar = !_showBottomBar;
  }

  void toggleBottomBar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shadowColor: primaryColor,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      elevation: 10,
      color: Colors.black,
      height: 64,
      child: Container(
        height: 64,
        decoration: BoxDecoration(color: white),
        child: Column(
          children: [
            space(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bottomCard(
                  // ignore: deprecated_member_use
                  icon: FontAwesomeIcons.home,
                  size: 27,
                  title: "Home",
                  onTap: () {},
                ),
                bottomCard(
                  icon: FontAwesomeIcons.book,
                  title: "Booking",
                  onTap: () {},
                ),
                space(width: 40),
                bottomCard(
                  size: 25,
                  icon: Icons.settings,
                  title: "Manage",
                  onTap: () {},
                ),
                bottomCard(
                  icon: Icons.person,
                  size: 25,
                  title: 'profile',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomCard({
  required IconData icon,
  double? size,
  required String title,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: SizedBox(
            height: 25,
            width: 30,
            child: Icon(
              icon,
              size: size ?? 20,
              color: primaryColor,
            )),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 16, color: primaryColor),
      )
    ],
  );
}
