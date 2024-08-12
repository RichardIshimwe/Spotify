import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/button/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title, this.hideBack = false});

  final Widget? title;
  final bool hideBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode
                          ? Colors.white.withOpacity(0.03)
                          : Colors.black.withOpacity(0.04)),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  )),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
