import 'package:cooloc/data/connect_to_api.dart';
import 'package:cooloc/pages/groceries_page.dart';
import 'package:cooloc/pages/notification_page.dart';
import 'package:cooloc/pages/tasks_page.dart';
import 'package:cooloc/theme/colors.dart';
import 'package:cooloc/widgets/drawer.dart';
import 'package:cooloc/widgets/pop_up_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class MainPage extends HookWidget{
  MainPage({super.key});
  final NetworkLayer networkLayer = NetworkLayer();
  late ValueNotifier<int> _currentIndex;


  void showBottomPopup(BuildContext context) {
    List<int> month = List.generate(13, (index) => index);
    List<DropdownMenuItem<int>> items = month
        .map((e) => DropdownMenuItem<int>(value: e, child: Text(e.toString())))
        .toList();
    List<int> day = List.generate(31, (index) => index);
    List<DropdownMenuItem<int>> dayItems = day
        .map((e) => DropdownMenuItem<int>(value: e, child: Text(e.toString())))
        .toList();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return PopUpContent(
              items: items,
              dayItems: dayItems);
        });
  }


  FloatingActionButton getFab(BuildContext context) {
    final List<FloatingActionButton> fabs = [
      FloatingActionButton(
        onPressed: () {
          showBottomPopup(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(onPressed: () {
        
      }, child: const Icon(Icons.remove)),
      FloatingActionButton(onPressed: () {}, child: const Icon(Icons.refresh)),
    ];

    return fabs[_currentIndex.value];
  }

  final List<Widget> _children = [
    const TasksPage(),
    const GroceriesPage(),
    const ViewPage('Page 3'),
  ];

  void onTabTapped(int index) =>
      _currentIndex.value = index;

  @override
  Widget build(BuildContext context) {

  _currentIndex = useState(0);

    var navigationBar = SalomonBottomBar(
      backgroundColor: backgroundColor,
      currentIndex: _currentIndex.value,
      onTap: (i) =>  _currentIndex.value = i,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.local_grocery_store),
          title: const Text("Likes"),
          selectedColor: Theme.of(context).primaryColor,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(Icons.info),
          title: const Text("Search"),
          selectedColor: Theme.of(context).primaryColor,
        ),

      ],
    );

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),],
        ),
        drawer: const MyDrawer(),
        body: _children[_currentIndex.value],
        floatingActionButton: getFab(context),
        bottomNavigationBar: navigationBar);
  }
}

class ViewPage extends StatelessWidget {
  final String title;

  const ViewPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is $title'),
    );
  }
}
