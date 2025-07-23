import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  const BaseAppBar(
      {Key? key,
      required this.title,
      required this.appBar,
      required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "REVELATION25'",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'f1',
            ),
          ),
        ),
        const Spacer(),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Register'),
        ),
        _buildNavItem(context, 'Events', 0),
        _buildNavItem(context, 'Sponsors', 1),
        _buildNavItem(context, 'About Us', 2),
        _buildNavItem(context, 'Gallery', 3)
      ],
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      forceMaterialTransparency: true,
      foregroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  Widget _buildNavItem(BuildContext context, String text, int id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: () => _navigateToPage(context, id),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int id) {
    String route;
    switch (id) {
      case 0:
        route = '/events';
        break;
      case 1:
        route = '/sponsors';
        break;
      case 2:
        route = '/about';
        break;
      case 3:
        route = '/gallery';
        break;
      default:
        route = '/';
    }
    Navigator.pushNamed(context, route);
  }
}
