import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: const Text('Pages'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: const Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SettingsPage.routeName);
              }),
        ],
      ),
    );
  }
}
