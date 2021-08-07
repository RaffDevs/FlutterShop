import 'package:flutter/material.dart';
import 'package:shop/utils/app_route.dart';

class DrawerTile extends StatelessWidget {
  final String route;
  final String title;

  DrawerTile({
    this.route,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(title),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                route
              );
            },
          )
        ],
      ),
    );
  }
}