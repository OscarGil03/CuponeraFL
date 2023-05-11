import 'package:flutter/material.dart';

class RouteOption{

  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  RouteOption({
    required this.route, 
    required this.icon, 
    required this.name, 
    required this.screen
    });
}