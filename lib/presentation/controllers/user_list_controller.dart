import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/user.dart';

class UserController extends GetxController {
  var users = <UserEntity>[].obs;
  var filteredUsers = <UserEntity>[].obs;
  var searchQuery = ''.obs;
  var currentPage = 1.obs;
  final int pageSize = 8; // Número de elementos por página

  @override
  void onInit() {
    super.onInit();
    // Inicializamos la lista de usuarios
    users.value = [
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
      UserEntity(
        id: 7,
        name: 'Sofía Gómez',
        email: 'sofia@example.com',
        password: 'sofiaPass987',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        department: 'Operaciones',
        profileImage: 'https://example.com/sofia.jpg',
        position: 'Coordinadora de Proyectos',
      ),
      UserEntity(
        id: 8,
        name: 'Sofía Gómez',
        email: 'sofia@example.com',
        password: 'sofiaPass987',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        department: 'Operaciones',
        profileImage: 'https://example.com/sofia.jpg',
        position: 'Coordinadora de Proyectos',
      ),
      UserEntity(
        id: 9,
        name: 'Sofía Gómez',
        email: 'sofia@example.com',
        password: 'sofiaPass987',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        department: 'Operaciones',
        profileImage: 'https://example.com/sofia.jpg',
        position: 'Coordinadora de Proyectos',
      ),
      UserEntity(
        id: 10,
        name: 'daniel quingtero',
        email: 'sofia@example.com',
        password: 'sofiaPass987',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        department: 'Dirección General de Tecnología de Información',
        profileImage: 'https://example.com/sofia.jpg',
        position: 'Coordinadora de Proyectos',
      ),
    ];
    filteredUsers.value = users;
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredUsers.value = users;
    } else {
      filteredUsers.value = users
          .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    currentPage.value = 1; // Reiniciamos la página al buscar
  }

  List<UserEntity> getPaginatedUsers() {
    final start = (currentPage.value - 1) * pageSize;
    final end = start + pageSize;
    return filteredUsers.sublist(
      start,
      end > filteredUsers.length ? filteredUsers.length : end,
    );
  }

  void nextPage() {
    if (currentPage.value * pageSize < filteredUsers.length) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }

  void deleteUser(int id) {
    users.removeWhere((user) => user.id == id);
    filteredUsers.removeWhere((user) => user.id == id);
  }
}