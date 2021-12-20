


import 'package:firstflutter/common/AppPathes.dart';
import 'package:firstflutter/state_manager/AppStateManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  static MaterialPage page() {
    return MaterialPage(
      name: AppPathes.login,
      key: ValueKey(AppPathes.login),
      child:  Login(),
    );
  }


  @override
  State<StatefulWidget> createState()  => _loginState();
  }

class _loginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: TextButton(child: Text("login"),onPressed: (){
            Provider.of<AppStateManager>(context, listen: false).login('mockUsername', 'mockPassword');
          },),
        ),
      ),
    );
  }

}