import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/user.dart';
import '../../../controllers/user_edit_controller.dart';
import '../../../controllers/user_list_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Para manejar archivos de imagen


class ListUser extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
        SizedBox(
          height: 60,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar usuario',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                userController.search(query);
              },
            ),
          ),
        ),

        // Lista de usuarios paginada
        Expanded(
          child: Obx(() {
            final paginatedUsers = userController.getPaginatedUsers();
            return ListView.builder(
              itemCount: paginatedUsers.length,
              itemBuilder: (context, index) {
                final user = paginatedUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("user.profileImage"),
                  ),
                  title: Text(user.name),
                  subtitle: Text('${user.department} - ${user.position}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          bool? isConfirmed = await showConfirmationDialog(context, '¿Estás seguro de realizar esta acción?');
                          if (isConfirmed == true) {
                            print('El usuario confirmó la acción.');
                            userController.deleteUser(user.id);
                          } else {
                            print('El usuario canceló la acción.');
                          }
                          //userController.deleteUser(user.id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.red),
                        onPressed: () async {
                          UserEntity? updatedUser = await Get.dialog<UserEntity?>(
                            UserEditDialog(user: user),
                          );

                          if (updatedUser != null) {
                            print('Usuario actualizado: ${updatedUser.name}, ${updatedUser.email}');
                            // Aquí puedes actualizar el estado o enviar los datos al servidor
                          } else {
                            print('Edición cancelada.');
                          }
                        },
                      ),
                    ],
                  ),
                  onTap: ()  {
                    ShowUserDetails( context,user);
                    //Get.snackbar('Usuario seleccionado', user.name);
                  },
                );
              },
            );
          }),
        ),

        // Paginación
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: userController.currentPage.value > 1
                    ? () => userController.previousPage()
                    : null,
              ),
              Text(
                'Página ${userController.currentPage.value}',
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: userController.currentPage.value * userController.pageSize <
                    userController.filteredUsers.length
                    ? () => userController.nextPage()
                    : null,
              ),
            ],
          );
        }),
      ],
    );
  }
}


void ShowUserDetails(BuildContext context,UserEntity user) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(user.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("user.profileImage"),
              ),
            ),
            const SizedBox(height: 10),
            Text('Email: ${user.email}'),
            const SizedBox(height: 5),
            Text('Departamento: ${user.department}'),
            const SizedBox(height: 5),
            Text('Posición: ${user.position}'),
            const SizedBox(height: 5),
            Text('Creado: ${user.createdAt.toString()}'),
            const SizedBox(height: 5),
            Text('Última actualización: ${user.updatedAt.toString()}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el modal
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}




Future<bool> showConfirmationDialog(BuildContext context, String message) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmación'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Retorna false para "No"
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Retorna true para "Sí"
            },
            child: const Text('Sí'),
          ),
        ],
      );
    },
  ) ?? false; // Si se cierra el diálogo sin acción, retorna false por defecto
}




class UserEditDialog extends StatelessWidget {
  final UserEntity user;

  const UserEditDialog({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inicializamos el controlador y le pasamos el usuario
    final UserEditController controller = Get.put(UserEditController());
    controller.initialize(user);

    return AlertDialog(
      title: const Text('Editar Usuario'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => TextField(
              controller: TextEditingController(text: controller.name.value),
              onChanged: (value) => controller.name.value = value,
              decoration: const InputDecoration(labelText: 'Nombre'),
            )),
            Obx(() => TextField(
              controller: TextEditingController(text: controller.email.value),
              onChanged: (value) => controller.email.value = value,
              decoration: const InputDecoration(labelText: 'Correo Electrónico'),
            )),
            Obx(() => SwitchListTile(
              title: const Text('Activo'),
              value: controller.isActive.value,
              onChanged: (value) => controller.isActive.value = value,
            )),
            Obx(() => DropdownButtonFormField<String>(
              value: controller.rol.value, // Directamente usa el valor actual (ya validado)
              items: controller.roles.map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.rol.value = value;
                }
              },
              decoration: const InputDecoration(labelText: 'Rol'),
              hint: const Text('Selecciona un rol'), // Mensaje de marcador
            )),

            Obx(() => DropdownButtonFormField<String>(
              value: controller.department.value.isNotEmpty ? controller.department.value : null,
              items: controller.departments.map((dept) {
                return DropdownMenuItem<String>(
                  value: dept,
                  child: Text(dept),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.department.value = value;
                }
              },
              decoration: const InputDecoration(labelText: 'Departamento'),
              hint: const Text('Selecciona un departamento'), // Mensaje de marcador
            )),
            Obx(() => TextField(
              controller: TextEditingController(text: controller.position.value),
              onChanged: (value) => controller.position.value = value,
              decoration: const InputDecoration(labelText: 'Cargo'),
            )),
            Obx(() => Column(
              children: [
                if (controller.profileImage.value != null)
                  Image.file(
                    controller.profileImage.value!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => controller.pickImage(),
                  child: const Text('Cargar Imagen de Perfil'),
                ),
              ],
            )),
          ],
        ),
      ),
      actions: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Obtiene el usuario actualizado y cierra el diálogo
                UserEntity updatedUser = controller.updateUser(user);
                Get.back(result: updatedUser); // Retorna el usuario actualizado
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ],
    );
  }
}

