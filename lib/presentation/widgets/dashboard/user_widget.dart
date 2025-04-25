import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/menu_dashboard_controller.dart';



class UserWidget extends StatelessWidget {
   UserWidget({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;
  final  menuController = Get.find<MenuControllerScreen>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.add, color: colors.primary),
      title: Text('Usuarios'),
      children: [
        ListTile(
          title: Text('Lista de Usuarios'),
          onTap: () {
            menuController.changeScreen(1);
            Get.back(); // Cierra el Drawer
          },
        ),
        ListTile(
          title: Text('Registro'),
          onTap: () {
            menuController.changeScreen(1);
            Get.back(); // Cierra el Drawer
          },
        ),
        ListTile(
          title: Text('Roles y Permisos'),
          onTap: () {
            menuController.changeScreen(1);
            Get.back(); // Cierra el Drawer
          },
        ),

      ],
    );
  }
}