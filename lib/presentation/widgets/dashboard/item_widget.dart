import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/menu_dashboard_controller.dart';



class ItemWidget extends StatelessWidget {
   ItemWidget({
    super.key,
    required this.colors,
    //required this.onPress,
    required this.text,
    //this.menuController,
     this.load,
    required this.icon,
  });
  //final VoidCallback? onPress;
  final Color colors;
  final String text;
  final String? load;
  //final MenuController? menuController;
  final IconData icon;
  final  menuController = Get.find<MenuControllerScreen>();
  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: colors),
      title: Text(text),
      // onTap: onPress,
      onTap: () {
        if(load == 'home') menuController.changeScreen(0);
        // if(menuController != null)menuController!.changeOption(text);
        Get.back(); // Cierra el Drawer
      },
    );
  }
}