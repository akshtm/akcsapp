import 'package:akcsapp/scReens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AKCSBottomNavigationbar extends StatelessWidget {
  const AKCSBottomNavigationbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dashboard.SelectedIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
            selectedItemColor: Colors.black,
            currentIndex: updatedIndex,
            onTap: (newIndex) {
              dashboard.SelectedIndexNotifier.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_rounded), label: 'Grocery Store')
            ]);
      },
    );
  }
}
