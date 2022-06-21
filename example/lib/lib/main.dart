// ignore: depend_on_referenced_packages
import 'package:custom_popup_menu/custom_popup_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'gesture_demo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Popup Menu Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CustomPopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();
  GlobalKey btnKey4 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void onClickMenu(MenuItemProvider item) {
    if (kDebugMode) {
      print('Click menu -> ${item.menuTitle}');
    }
  }

  void onDismiss() {
    if (kDebugMode) {
      print('Menu is dismiss');
    }
  }

  void onShow() {
    if (kDebugMode) {
      print('Menu is show');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: MaterialButton(
                height: 45.0,
                key: btnKey,
                onPressed: maxColumn,
                child: const Text('Show Menu'),
              ),
            ),
            MaterialButton(
              key: btnKey2,
              height: 45.0,
              onPressed: customBackground,
              child: const Text('Show Menu'),
            ),
            MaterialButton(
              key: btnKey3,
              height: 45.0,
              onPressed: onDismissOnlyBeCalledOnce,
              child: const Text('Show Menu'),
            ),
            MaterialButton(
              key: btnKey4,
              height: 45.0,
              onPressed: listMenu,
              child: const Text('List Menu'),
            ),
            MaterialButton(
              height: 30.0,
              onPressed: onGesturesDemo,
              child: const Text('Gestures Demo'),
            )
          ],
        ),
      ),
    );
  }

  void onDismissOnlyBeCalledOnce() {
    menu = CustomPopupMenu(
      context: context,
      items: [
        // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
        // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
        CustomMenuItem(title: 'Mail', image: const Icon(Icons.mail, color: Colors.white)),
        CustomMenuItem(title: 'Power', image: const Icon(Icons.power, color: Colors.white)),
        CustomMenuItem(title: 'Setting', image: const Icon(Icons.settings, color: Colors.white)),
        CustomMenuItem(title: 'PopupMenu', image: const Icon(Icons.menu, color: Colors.white))
      ],
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu.show(widgetKey: btnKey3);
  }

  void onGesturesDemo() {
    // return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GestureDemo()),
    );
  }

  void maxColumn() {
    CustomPopupMenu menu = CustomPopupMenu(
      context: context,
      config: const MenuConfig(maxColumn: 3),
      items: [
        CustomMenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
        CustomMenuItem(title: 'Power', image: const Icon(Icons.power, color: Colors.white)),
        CustomMenuItem(title: 'Setting', image: const Icon(Icons.settings, color: Colors.white)),
        CustomMenuItem(title: 'PopupMenu', image: const Icon(Icons.menu, color: Colors.white))
      ],
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu.show(widgetKey: btnKey);
  }

  //
  void customBackground() {
    CustomPopupMenu menu = CustomPopupMenu(
        context: context,
        config: const MenuConfig(
          backgroundColor: Color(0xffc1e0f7),
          lineColor: Colors.tealAccent,
        ),
        items: [
          CustomMenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          CustomMenuItem(title: 'Home', image: const Icon(Icons.home, color: Colors.white)),
          CustomMenuItem(title: 'Mail', image: const Icon(Icons.mail, color: Colors.white)),
          CustomMenuItem(title: 'Power', image: const Icon(Icons.power, color: Colors.white)),
          CustomMenuItem(title: 'Setting', image: const Icon(Icons.settings, color: Colors.white)),
          CustomMenuItem(title: 'PopupMenu', image: const Icon(Icons.menu, color: Colors.white))
        ],
        onClickMenu: onClickMenu,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey2);
  }

  void listMenu() {
    CustomPopupMenu menu = CustomPopupMenu(
        context: context,
        config: MenuConfig.forList(),
        items: [
          // CustomMenuItem.forList(
          //     title: 'Copy', image: Image.asset('assets/copy.png')),
          CustomMenuItem.forList(title: 'Home', image: const Icon(Icons.home, color: Color(0xFF181818), size: 20)),
          CustomMenuItem.forList(title: 'Mail', image: const Icon(Icons.mail, color: Color(0xFF181818), size: 20)),
          CustomMenuItem.forList(title: 'Power', image: const Icon(Icons.power, color: Color(0xFF181818), size: 20)),
          CustomMenuItem.forList(title: 'Setting', image: const Icon(Icons.settings, color: Color(0xFF181818), size: 20)),
          CustomMenuItem.forList(title: 'PopupMenu', image: const Icon(Icons.menu, color: Color(0xFF181818), size: 20))
        ],
        onClickMenu: onClickMenu,
        onShow: onShow,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey4);
  }
}
