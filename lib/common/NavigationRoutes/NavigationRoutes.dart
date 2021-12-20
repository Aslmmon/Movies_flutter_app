import 'package:flutter/material.dart';

class NavigationRoutes{

  static goToSpecificRoute(BuildContext context,Widget secondRoute){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => secondRoute),
    );
  }
}