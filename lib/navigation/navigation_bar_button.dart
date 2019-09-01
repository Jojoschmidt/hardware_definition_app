import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

class NavigationBarButton extends StatefulWidget {
  final IconData icon;
  final isActive;
  final isMain;
  final String route;
  NavigationBarButton(this.icon, this.isActive,this.route,this.isMain);

  @override
  _NavigationBarButtonState createState() => _NavigationBarButtonState();
}

class _NavigationBarButtonState extends State<NavigationBarButton> {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:()=> widget.isActive ?{}: widget.isMain? Navigator.pop(context): Navigator.pushNamed(context, widget.route),
      child: Icon(
        widget.icon,
        size: 40,
        color: widget.isActive ? Colors.black : kBottomNavigationBarButtonInactiveColor,
      ),
    );
  }
}