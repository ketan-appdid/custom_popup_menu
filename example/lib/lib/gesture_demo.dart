// ignore_for_file: depend_on_referenced_packages

import 'package:custom_popup_menu/custom_popup_menu.dart';
import 'package:flutter/material.dart';

class GestureDemo extends StatefulWidget {
  const GestureDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GestureDemoState();
  }
}

class _GestureDemoState extends State<GestureDemo> {
  GlobalKey btnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Gestures'),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const SizedBox(
                height: 50.0,
                child: Text('test'),
              );
            },
          ),
          Positioned(
            left: 100.0,
            top: 100.0,
            width: 100.0,
            height: 50.0,
            child: MaterialButton(
              key: btnKey,
              onPressed: onShow,
              child: const Text('show'),
            ),
          )
        ],
      ),
    );
  }

  void onShow() {
    CustomPopupMenu menu = CustomPopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,
        // maxColumn: 2,
        items: [
          CustomMenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          CustomMenuItem(
              title: 'Home',
              // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
              image: const Icon(
                Icons.home,
                color: Colors.white,
              )),
          CustomMenuItem(
              title: 'Mail',
              image: const Icon(
                Icons.mail,
                color: Colors.white,
              )),
          CustomMenuItem(
              title: 'Power',
              image: const Icon(
                Icons.power,
                color: Colors.white,
              )),
          CustomMenuItem(
              title: 'Setting',
              image: const Icon(
                Icons.settings,
                color: Colors.white,
              )),
          CustomMenuItem(
              title: 'PopupMenu',
              image: const Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        onClickMenu: onClickMenu,
        // stateChanged: stateChanged,
        onDismiss: onDismiss,
        context: context);
    menu.show(widgetKey: btnKey);
  }

  void onClickMenu(MenuItemProvider item) {}

  void onDismiss() {}
}
