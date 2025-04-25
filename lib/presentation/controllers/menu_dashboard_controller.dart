import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../side_menu_dashboard/content/content_screen.dart';
import '../side_menu_dashboard/index/index_screen.dart';
import '../side_menu_dashboard/settings/settings_screen.dart';
import '../side_menu_dashboard/user/user_screen.dart';
import '../widgets/dashboard/UserPage/user_widget.dart';


class MenuControllerScreen extends GetxController {
  // Índice de la pantalla actual
  var currentIndex = 0.obs;

  // Lista de pantallas disponibles
  final List<Widget> screens = [
    IndexScreen(),
    UsersScreen(),
    ContentScreen(),
    SettingsScreen(),
    ListUser()
  ];


  // Método para cambiar la pantalla actual
  void changeScreen(int index) {
    currentIndex.value = index;
  }
}