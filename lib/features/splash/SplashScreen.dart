import 'dart:async';

import 'package:firstflutter/common/AppPathes.dart';
import 'package:firstflutter/common/NavigationRoutes/NavigationRoutes.dart';
import 'package:firstflutter/features/home/home.dart';
import 'package:firstflutter/features/login/login.dart';
import 'package:firstflutter/state_manager/AppStateManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPathes.splash,
      key: ValueKey(AppPathes.splash),
      child:  SplashScreen(),
    );
  }
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text("Welcome Splash"),
              TextButton(
                  onPressed: () {

                  },
                  child: Text("Im button"))
            ],
          ),
        ),
      ),
    );
  }
}
