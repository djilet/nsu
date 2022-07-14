import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsu_cab/modules/main/cubit/nav_bar/nav_bar_cubit.dart';
import 'package:nsu_cab/modules/deanoffice/deanoffice_screen/deanoffice_screen.dart';
import 'package:nsu_cab/modules/home/home_screen/home_screen.dart';
import 'package:nsu_cab/modules/main/view/custom_nav_bar/custom_nav_bar.dart';
import 'package:nsu_cab/modules/messages/messages_screen/messages_screen.dart';
import 'package:nsu_cab/modules/services/services_screen/services_screen.dart';
import 'package:nsu_cab/modules/timetable/timetable_screen/timetable_screen.dart';

class MainScreen extends StatefulWidget {
  final NavBarCubbit navBarCubbit;

  MainScreen({Key? key, required this.navBarCubbit}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _currentScreen = 'Screen1';
  int _selectedIndex = 0;

  final _screenKeys = ['Screen1', 'Screen2', 'Screen3', 'Screen4', 'Screen5'];

  final _navigatorKeys = {
    'Screen1': GlobalKey<NavigatorState>(),
    'Screen2': GlobalKey<NavigatorState>(),
    'Screen3': GlobalKey<NavigatorState>(),
    'Screen4': GlobalKey<NavigatorState>(),
    'Screen5': GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentScreen) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentScreen = _screenKeys[index];
        _selectedIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentScreen != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem] as GlobalKey<NavigatorState>,
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.navBarCubbit,
      child: BlocBuilder<NavBarCubbit, bool>(
        builder: (context, navBarState) => WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[_currentScreen]!.currentState!.maybePop();
            if (isFirstRouteInCurrentTab) {
              if (_currentScreen != "Screen1") {
                _selectTab("Screen1", 1);

                return false;
              }
            }
            // let system handle back button if we're on the first route
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            body: Stack(
              children: [
                _buildOffstageNavigator("Screen1"),
                _buildOffstageNavigator("Screen2"),
                _buildOffstageNavigator("Screen3"),
                _buildOffstageNavigator("Screen4"),
                _buildOffstageNavigator("Screen5"),
              ],
            ),
            bottomNavigationBar: navBarState
                ? CustomNavBar(
                    selectedIndex: _selectedIndex,
                    onTabChange: (int index) {
                      _selectTab(_screenKeys[index], index);
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({
    required this.navigatorKey,
    required this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    switch (tabItem) {
      case 'Screen2':
        child = TimetableScreen();
        break;
      case 'Screen3':
        child = DeanofficeScreen();
        break;
      case 'Screen4':
        child = MessagesScreen();
        break;
      case 'Screen5':
        child = ServicesScreen();
        break;
      default:
        child = HomeScreen();
        break;
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
