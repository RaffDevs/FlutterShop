import 'package:flutter/material.dart';
import 'package:shop/utils/app_route.dart';
import 'package:shop/widgets/drawer_tiles.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Usuario'),
            automaticallyImplyLeading: false,
          ),
          DrawerTile(title: 'Loja', route: AppRoutes.HOME),
          DrawerTile(title: 'Pedidos', route: AppRoutes.ORDERS)
        ],
      ),
    );
  }
}