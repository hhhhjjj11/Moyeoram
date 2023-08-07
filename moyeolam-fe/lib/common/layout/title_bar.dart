import 'package:flutter/material.dart';
import 'package:youngjun/common/const/colors.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({
    super.key,
    required this.onPressed,
    required this.titleIcon,
    required this.appBar,
    required this.title,
    required this.actions,
  });
  final VoidCallback onPressed;
  final IconData? titleIcon;
  final AppBar appBar;
  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: BACKGROUND_COLOR,
      title: Text(title, style:
        TextStyle(color: Colors.white),),
      actions: actions,
      // actions: [
      //
      //   IconButton(
      //       icon: Icon(titleIcon),
      //       color: MAIN_COLOR,
      //       onPressed: () {
      //         print("Pressed!");
      //         onPressed();
      //       }),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
