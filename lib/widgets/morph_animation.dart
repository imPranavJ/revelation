import 'package:flutter/material.dart';

class AnimatedTileMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final int index; // for staggered animation

  const AnimatedTileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  State<AnimatedTileMenuItem> createState() => _AnimatedTileMenuItemState();
}

class _AnimatedTileMenuItemState extends State<AnimatedTileMenuItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _radiusAnim = Tween<double>(begin: 8, end: 24).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _opacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Staggered start
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnim.value,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.15),
            borderRadius: BorderRadius.circular(_radiusAnim.value),
          ),
          child: ListTile(
            leading: Icon(widget.icon, color: Colors.amber),
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
