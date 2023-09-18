import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/widget/home_page.dart';
import 'package:flutter_boilerplate/shared/constants/app_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static DashboardPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<DashboardPageState>();
  }

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final pageController = PageController();

  Future<bool> onWillPop() async {
    if (pageController.page?.toInt() == 0) {
      return true;
    }

    pageController.jumpToPage(0);
    return false;
  }

  void jumpToPage(int page) => pageController.jumpToPage(page);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: PageView(
            controller: pageController,
            children: const [
              HomePage(),
              HomePage(),
            ],
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  Widget buildBottomNavigationBar() {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return NavigationBar(
            backgroundColor: Colors.white,
            elevation: 3,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.space_dashboard_outlined),
                selectedIcon: Icon(Icons.space_dashboard),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.task_outlined),
                selectedIcon: Icon(Icons.task),
                label: 'Penugasan',
              ),
            ],
            height: 60,
            surfaceTintColor: AppColors.redMain,
            selectedIndex: pageController.page?.toInt() ?? 0,
            onDestinationSelected: pageController.jumpToPage,
          );
        });
  }
}
