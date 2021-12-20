import 'package:firstflutter/common/AppPathes.dart';
import 'package:firstflutter/features/home/popular_movies/PopularMoviesScreen.dart';
import 'package:firstflutter/features/login/login.dart';
import 'package:firstflutter/state_manager/AppStateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  static MaterialPage page(int getSelectedTab) {
    return MaterialPage(
      name: AppPathes.home,
      key: ValueKey(AppPathes.splash),
      child:  Home(currentTab: getSelectedTab),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    PopularMovies(),
    Login(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
        Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (index) {
          Provider.of<AppStateManager>(context, listen: false)
              .goToTab(index);
        },

        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'New ',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Old',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recent',
          ),
        ],
      ),
    );
  }
}
