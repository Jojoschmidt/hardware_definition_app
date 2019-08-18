import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

class NavigationBarButton extends StatefulWidget {
  final IconData icon;
  final isActive;
  final String route;
  NavigationBarButton(this.icon, this.isActive,this.route);

  @override
  _NavigationBarButtonState createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<NavigationBarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> Navigator.pushNamed(context, widget.route),

      child: Icon(
        widget.icon,
        size: 40,
        color: widget.isActive ? Colors.black : kBottomNavigationBarButtonInactiveColor,
      ),
    );
  }
}