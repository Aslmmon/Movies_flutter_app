import 'dart:async';
import 'package:flutter/material.dart';

// 1
class HomeTabs {
  static const int home = 0;
  static const int location = 1;
  static const int add = 2;
  static const int notification = 3;
  static const int profile = 4;

}

class AppStateManager extends ChangeNotifier {
  // 2
  bool _initialized = false;
  // 3
  bool _loggedIn = false;
  // 4
  bool _onboardingComplete = false;
  // 5
  int _selectedTab = HomeTabs.home;

  // 6
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    // 7
    Timer(const Duration(milliseconds: 2000), () {
      // 8
      _initialized = true;
      // 9
      notifyListeners();
    },
    );
  }

  void login(String username, String password) {
    // 10
    _loggedIn = true;
    // 11
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }


  void logout() {
    // 12
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    // 13
    initializeApp();
    // 14
    notifyListeners();
  }

}
