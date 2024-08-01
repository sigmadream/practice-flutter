import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool isLeading;
  Function? onTapBackButton;
  List<Widget>? actions;

  CommonAppBar({
    super.key,
    required this.title,
    required this.isLeading,
    this.actions,
    this.onTapBackButton,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48,
      automaticallyImplyLeading: isLeading,
      titleSpacing: isLeading ? 0 : 16,
      scrolledUnderElevation: 3,
      backgroundColor: Colors.white,
      leading: isLeading
          ? GestureDetector(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onTap: () {
                onTapBackButton != null
                    ? onTapBackButton!.call()
                    : Navigator.pop(context);
              },
            )
          : null,
      elevation: 1,
      actions: actions,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
