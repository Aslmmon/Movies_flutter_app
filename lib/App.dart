import 'package:firstflutter/state_manager/AppStateManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'common/NavigationTwo/AppRoutes.dart';
import 'features/splash/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'data/memory_repository.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;



  @override
  void initState() {
    super.initState();
    _setupLogging();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MemoryRepository>(
          create: (_) => MemoryRepository(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: MaterialApp(
        title: "first Flutter",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Router(
          routerDelegate: _appRouter,
        ),
      ),
    );
  }

}
