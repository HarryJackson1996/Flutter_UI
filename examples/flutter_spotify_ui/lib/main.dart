import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/providers/navigation_provider.dart';
import 'package:flutter_spotify_ui/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(150, 150, 150, 1),
          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
          onTap: (int index) {
            context.read<NavigationProvider>().setTab(index);
          },
          currentIndex: context.watch<NavigationProvider>().currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Icon(Icons.search),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Icon(Icons.align_vertical_bottom_outlined),
              ),
              label: 'Your library',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Icon(Icons.settings),
              ),
              label: 'Premium',
            ),
          ],
        ),
        body: context.read<NavigationProvider>().currentIndex == 0 ? HomeScreen() : Container(),
      ),
    );
  }
}
