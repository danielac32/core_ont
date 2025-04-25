import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/user.dart';
import '../controllers/menu_dashboard_controller.dart';
import '../widgets/dashboard/UserPage/user_widget.dart';
import '../widgets/dashboard/avatar_widget.dart';
import '../widgets/dashboard/config_widget.dart';
import '../widgets/dashboard/content_widget.dart';
import '../widgets/dashboard/drawer_header.dart';
import '../widgets/dashboard/item_widget.dart';






class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return  HomeScreen();
  }
}



class HomeScreen extends StatelessWidget {
  // Instancia del controlador
  final  menuControllerScreen = Get.put(MenuControllerScreen());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final UserEntity? user = Get.arguments as UserEntity?;

    user.toString();
    // Verificar si el argumento es nulo
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("No se proporcionó un usuario."),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: colors.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado del Drawer
            DrawerWidget(colors: colors, user: user),
            //////////////////////////////////////////////////////////////////////////////
            // Opciones del menú
            ItemWidget(icon:Icons.home,colors:colors.primary,text: 'Inicio',load:'home'),
            UserWidget(colors: colors),
            ContentWidget(colors: colors),//SubMenuWidget(colors: colors, menuController: menuController),
            ConfigWidget(colors: colors),
            Divider(),
            ItemWidget(icon:Icons.logout,colors:colors.error,text: 'Cerrar sesión'),
          ],
        ),
      ),

      //body: LoadChild(menuController: menuController),
      body: Obx((){
         return menuControllerScreen.screens[menuControllerScreen.currentIndex.value];
      }),
    );
  }
}

/*
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.colors,
    required this.user,
  });

  final ColorScheme colors;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: colors.primary,
    
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(colors: colors,urlImage: ""),
            SizedBox(height: 10),
            TextDrawerDashboard(text: user.position!, colors: colors.onPrimary,size: 18),
            TextDrawerDashboard(text: user.email, colors: colors.onPrimary.withOpacity(0.7),size: 14),
            TextDrawerDashboard(text: user.name, colors: colors.onPrimary.withOpacity(0.7),size: 14),
          ],
        ),
      ),
    );
  }
}

*/
















/*
class SubMenuWidget extends StatelessWidget {
  const SubMenuWidget({
    super.key,
    required this.colors,
    required this.menuController,
  });

  final ColorScheme colors;
  final MenuController menuController;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.pages, color: colors.primary),
      title: Text('Páginas o Contenido'),
      children: [
        ListTile(
          title: Text('Página 1'),
          onTap: () {
            menuController.changeOption('Página 1');
            menuController.changePage(0);
            Get.back(); // Cierra el Drawer
          },
        ),
        ListTile(
          title: Text('Página 2'),
          onTap: () {
            menuController.changeOption('Página 2');
            menuController.changePage(1);
            Get.back(); // Cierra el Drawer
          },
        ),
        ListTile(
          title: Text('Página 3'),
          onTap: () {
            menuController.changeOption('Página 3');
            menuController.changePage(2);
            Get.back(); // Cierra el Drawer
          },
        ),
      ],
    );
  }
}





class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    super.key,
    required this.menuController,
    required this.colors,
  });

  final MenuController menuController;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (menuController.selectedOption.value) {
        case 'Crear Usuario':
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle, size: 60, color: colors.primary),
                SizedBox(height: 10),
                Text('Formulario para crear un nuevo usuario', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        case 'Usuarios':
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.group, size: 60, color: colors.primary),
                SizedBox(height: 10),
                Text('Lista de usuarios registrados', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        case 'Página 1':
        case 'Página 2':
        case 'Página 3':
          return Center(
            child: Text(
              menuController.pages[menuController.currentPageIndex.value],
              style: TextStyle(fontSize: 24),
            ),
          );
        case 'Configuración':
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 60, color: colors.primary),
                SizedBox(height: 10),
                Text('Panel de configuración del CMS', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        default:
          return Center(
            child: Text(
              'Bienvenido al CMS',
              style: TextStyle(fontSize: 24, color: colors.primary),
            ),
          );
      }
    });
  }
}*/