import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.prefex,
    required this.sufix,
    this.sufixOnTap,
  });
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final String title;
  final String prefex;
  final String sufix;
  final void Function()? sufixOnTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      toolbarHeight: preferredSize.height,
      leadingWidth: 0,
      leading: const SizedBox.shrink(),
      title: SizedBox(
        height: preferredSize.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: sufixOnTap,
              child: SvgPicture.asset(sufix, width: 26),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),

            SvgPicture.asset(prefex, width: 20),
          ],
        ),
      ),
    );
  }
}
