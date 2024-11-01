import 'package:done_stuff/ui/define/size.dart';
import 'package:done_stuff/utility/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavigationItemType {
  stuffManagement('Stuff 관리'),
  record('기록'),
  history('히스토리'),
  ;

  const BottomNavigationItemType(this.label);

  final String label;

  IconData get activeIcon => switch (this) {
        stuffManagement => Icons.home,
        record => Icons.newspaper,
        history => Icons.shopping_bag,
      };

  IconData get icon => switch (this) {
        stuffManagement => Icons.home_outlined,
        record => Icons.newspaper_outlined,
        history => Icons.shopping_bag_outlined,
      };

  BottomNavigationBarItem get item => BottomNavigationBarItem(
        activeIcon: SizedBox(
          width: double.infinity,
          child: Icon(activeIcon),
        ),
        icon: SizedBox(
          width: double.infinity,
          child: Icon(icon),
        ),
        label: label,
      );
}

class MainShellPage extends StatelessWidget {
  const MainShellPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: CustomSize.xxl,
        titleSpacing: CustomSize.l,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'MVGT',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // TODO : 검색, 알림, 장바구니 아이콘 추가
      ),
      body: navigationShell,
    );
  }
}
