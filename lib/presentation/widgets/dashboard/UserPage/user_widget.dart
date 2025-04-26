import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/user.dart';
import '../../../controllers/menu_dashboard_controller.dart';
import '../../../controllers/user_list_controller.dart';



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
            menuController.changeScreen(4);
            Get.back(); // Cierra el Drawer
          },
        ),
        ListTile(
          title: Text('Registro'),
          onTap: () {
            menuController.changeScreen(5);
            Get.back(); // Cierra el Drawer
          },
        ),
        /*ListTile(
          title: Text('Roles y Permisos'),
          onTap: () {
            menuController.changeScreen(1);
            Get.back(); // Cierra el Drawer
          },
        ),*/

      ],
    );
  }
}



// Controlador GetX para manejar la lógica de la lista y la paginación





/*
// Widget principal con layout estructurado
class ListUser2 extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        //Header(),

        // Contenido principal: Sidebar + Content
        Expanded(
          child: Row(
            children: [
              // Sidebar
              Sidebar(),

              // Content
              Expanded(
                child: Content(userController: userController),
              ),
            ],
          ),
        ),

        // Footer
       // Footer(),
      ],
    );
  }
}

// Header
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 60,
      color: colors.secondary,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Panel de Usuarios',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Get.snackbar('Configuración', 'Accediendo a configuración...');
            },
          ),
        ],
      ),
    );
  }
}

// Sidebar
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Menú',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Get.snackbar('Inicio', 'Navegando al inicio...');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Usuarios'),
            onTap: () {
              Get.snackbar('Usuarios', 'Mostrando lista de usuarios...');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              Get.snackbar('Configuración', 'Accediendo a configuración...');
            },
          ),
        ],
      ),
    );
  }
}

// Content
class Content extends StatelessWidget {
  final UserController userController;

  Content({required this.userController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Barra de búsqueda
          TextField(
            decoration: InputDecoration(
              labelText: 'Buscar usuario',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              userController.search(query);
            },
          ),
          SizedBox(height: 16),

          // Lista de usuarios paginada
          Expanded(
            child: Obx(() {
              final paginatedUsers = userController.getPaginatedUsers();
              return ListView.builder(
                itemCount: paginatedUsers.length,
                itemBuilder: (context, index) {
                  final user = paginatedUsers[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text('${user.email} - ${user.department}'),
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
                Text('Página ${userController.currentPage.value}'),
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
      ),
    );
  }
}

// Footer
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          '© 2023 Todos los derechos reservados',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
*/



/*
// Widget principal
class ListUser extends StatelessWidget {
  ListUser({super.key});

  final UserController userController = Get.put(UserController());

  // Método para mostrar los detalles del usuario en un modal
  void _showUserDetails(BuildContext context, UserEntity user) {
    showDialog(
      context: context,
      builder: (context) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Buscador
        SizedBox(
          height: 60,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar por nombre',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => userController.search(value),
            ),
          ),
        ),

        // Lista de usuarios
        Expanded(
          child: Obx(() {
            final paginatedUsers = userController.getPaginatedUsers();
            return ListView.builder(
              itemCount: paginatedUsers.length,
              itemBuilder: (context, index) {
                final user = paginatedUsers[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => _showUserDetails(context, user), // Mostrar detalles al hacer clic
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("user.profileImage"),
                      ),
                      title: Text(user.name),
                      subtitle: Text('${user.department} - ${user.position}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Lógica para editar
                             // Get.snackbar('Editar', 'Editar usuario: ${user.name}');
                              Get.snackbar(
                                'Editar',
                                "Editar usuario:",
                                colorText: Colors.white,
                                backgroundColor: Colors.lightBlue,
                                icon: const Icon(Icons.add_alert),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              userController.deleteUser(user.id);
                              Get.snackbar('Eliminar', 'Usuario eliminado: ${user.name}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
                onPressed: userController.previousPage,
              ),
              Text('Página ${userController.currentPage}'),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: userController.nextPage,
              ),
            ],
          );
        }),
      ],
    );
  }
}
*/





















/*
class ListUser extends StatelessWidget {


   ListUser({super.key});
   final users = [
     UserEntity(
       id: 1,
       name: 'Juan Pérez',
       email: 'juan@example.com',
       password: 'contraseñaSegura123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Ventas',
       profileImage: 'https://example.com/profile.jpg',
       position: 'Gerente de Ventas',
     ),
     UserEntity(
       id: 2,
       name: 'María López',
       email: 'maria@example.com',
       password: 'claveSegura456',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Recursos Humanos',
       profileImage: 'https://example.com/maria.jpg',
       position: 'Especialista en Reclutamiento',
     ),
     UserEntity(
       id: 3,
       name: 'Carlos Ramírez',
       email: 'carlos@example.com',
       password: 'password789',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Tecnología',
       profileImage: 'https://example.com/carlos.jpg',
       position: 'Desarrollador Senior',
     ),
     UserEntity(
       id: 4,
       name: 'Ana Torres',
       email: 'ana@example.com',
       password: 'anaPass123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Marketing',
       profileImage: 'https://example.com/ana.jpg',
       position: 'Especialista en Redes Sociales',
     ),
     UserEntity(
       id: 5,
       name: 'Luis Fernández',
       email: 'luis@example.com',
       password: 'luisSecurePass',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Finanzas',
       profileImage: 'https://example.com/luis.jpg',
       position: 'Analista Financiero',
     ),
     UserEntity(
       id: 6,
       name: 'Sofía Gómez',
       email: 'sofia@example.com',
       password: 'sofiaPass987',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Operaciones',
       profileImage: 'https://example.com/sofia.jpg',
       position: 'Coordinadora de Proyectos',
     ),
   ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
            ),
          ),
        ),

        // Lista de usuarios
        ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Stack(
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user.profileImage ?? ''),
                              child: user.profileImage == null
                                  ? Text(user.name[0])
                                  : null,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(user.position ?? ''),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(user.email),
                        if (user.department != null) Text('Departamento: ${user.department}'),
                      ],
                    ),
                  ),
                ),
                if (user.isActive)
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.check, size: 15, color: Colors.white),
                    ),
                  ),
              ],
            );
          },
        ),

        // Título flotante
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Lista de Usuarios',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/
/*
class ListUser extends StatelessWidget {


   ListUser({super.key});
   final users = [
     UserEntity(
       id: 1,
       name: 'Juan Pérez',
       email: 'juan@example.com',
       password: 'contraseñaSegura123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Ventas',
       profileImage: 'https://example.com/profile.jpg',
       position: 'Gerente de Ventas',
     ),
     UserEntity(
       id: 2,
       name: 'María López',
       email: 'maria@example.com',
       password: 'claveSegura456',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Recursos Humanos',
       profileImage: 'https://example.com/maria.jpg',
       position: 'Especialista en Reclutamiento',
     ),
     UserEntity(
       id: 3,
       name: 'Carlos Ramírez',
       email: 'carlos@example.com',
       password: 'password789',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Tecnología',
       profileImage: 'https://example.com/carlos.jpg',
       position: 'Desarrollador Senior',
     ),
     UserEntity(
       id: 4,
       name: 'Ana Torres',
       email: 'ana@example.com',
       password: 'anaPass123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Marketing',
       profileImage: 'https://example.com/ana.jpg',
       position: 'Especialista en Redes Sociales',
     ),
     UserEntity(
       id: 5,
       name: 'Luis Fernández',
       email: 'luis@example.com',
       password: 'luisSecurePass',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Finanzas',
       profileImage: 'https://example.com/luis.jpg',
       position: 'Analista Financiero',
     ),
     UserEntity(
       id: 6,
       name: 'Sofía Gómez',
       email: 'sofia@example.com',
       password: 'sofiaPass987',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Operaciones',
       profileImage: 'https://example.com/sofia.jpg',
       position: 'Coordinadora de Proyectos',
     ),
   ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.profileImage ?? ''),
                    ),
                    if (user.profileImage == null)
                      Text(
                        user.name.split(' ').map((e) => e[0]).join(),
                        style: const TextStyle(fontSize: 24),
                      ),
                    if (user.isActive)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  user.position ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  user.department ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.email),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
*/



/*
class ListUser extends StatelessWidget {


   ListUser({super.key});
   final users = [
     UserEntity(
       id: 1,
       name: 'Juan Pérez',
       email: 'juan@example.com',
       password: 'contraseñaSegura123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Ventas',
       profileImage: 'https://example.com/profile.jpg',
       position: 'Gerente de Ventas',
     ),
     UserEntity(
       id: 2,
       name: 'María López',
       email: 'maria@example.com',
       password: 'claveSegura456',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Recursos Humanos',
       profileImage: 'https://example.com/maria.jpg',
       position: 'Especialista en Reclutamiento',
     ),
     UserEntity(
       id: 3,
       name: 'Carlos Ramírez',
       email: 'carlos@example.com',
       password: 'password789',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Tecnología',
       profileImage: 'https://example.com/carlos.jpg',
       position: 'Desarrollador Senior',
     ),
     UserEntity(
       id: 4,
       name: 'Ana Torres',
       email: 'ana@example.com',
       password: 'anaPass123',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Marketing',
       profileImage: 'https://example.com/ana.jpg',
       position: 'Especialista en Redes Sociales',
     ),
     UserEntity(
       id: 5,
       name: 'Luis Fernández',
       email: 'luis@example.com',
       password: 'luisSecurePass',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Finanzas',
       profileImage: 'https://example.com/luis.jpg',
       position: 'Analista Financiero',
     ),
     UserEntity(
       id: 6,
       name: 'Sofía Gómez',
       email: 'sofia@example.com',
       password: 'sofiaPass987',
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
       department: 'Operaciones',
       profileImage: 'https://example.com/sofia.jpg',
       position: 'Coordinadora de Proyectos',
     ),
   ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Departamento')),
          DataColumn(label: Text('Cargo')),
          DataColumn(label: Text('Estado')),
        ],
        rows: users.map((user) {
          return DataRow(cells: [
            DataCell(
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.profileImage ?? ''),
                    child: user.profileImage == null ? Text(user.name[0]) : null,
                  ),
                  const SizedBox(width: 10),
                  Text(user.name),
                ],
              ),
            ),
            DataCell(Text(user.email)),
            DataCell(Text(user.department ?? '--')),
            DataCell(Text(user.position ?? '--')),
            DataCell(
              Chip(
                label: Text(user.isActive ? 'Activo' : 'Inactivo'),
                backgroundColor: user.isActive
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
*/
/*
class ListUser extends StatelessWidget {
  // Lista de archivos de ejemplo
  final List<Map<String, dynamic>> files = [
    {'name': 'Documento.pdf', 'icon': Icons.picture_as_pdf, 'color': Colors.red},
    {'name': 'Imagen.jpg', 'icon': Icons.image, 'color': Colors.blue},
    {'name': 'Planilla.xlsx', 'icon': Icons.table_chart, 'color': Colors.green},
    {'name': 'Presentación.pptx', 'icon': Icons.slideshow, 'color': Colors.orange},
    {'name': 'Código.dart', 'icon': Icons.code, 'color': Colors.purple},
  ];

    ListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Fondo degradado
          Container(
            width: 350,
            height: 500,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // Contenedor de la lista
          Positioned(
            top: 40,
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return _buildFileItem(file);
                },
              ),
            ),
          ),

          // Título flotante
          const Positioned(
            top: 10,
            child: Text(
              'Mis Archivos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),

          // Botón de acción flotante
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Acción para añadir archivos
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para cada ítem de archivo
  Widget _buildFileItem(Map<String, dynamic> file) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (file['color'] as Color).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(file['icon'] as IconData, color: file['color'] as Color),
        ),
        title: Text(
          file['name'] as String,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          // Acción al tocar un archivo
        },
      ),
    );
  }
}*/