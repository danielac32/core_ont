import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/user.dart';

class UserEditController extends GetxController {
  // Variables observables para los campos del formulario
  final name = ''.obs;
  final email = ''.obs;
  final isActive = true.obs;
  final rol = ''.obs;
  final department = ''.obs;
  final position = ''.obs;
  final profileImage = Rxn<File>(); // Imagen de perfil (puede ser nula)

  // Listas de opciones predefinidas
  final List<String> roles = ['USER', 'ADMIN'];
  final List<String> departments = [
    'Dirección General de Administración y Servicios',
    'Dirección General de Egreso',
    'Dirección General de Cuenta Única',
    'Dirección General de Tecnología de Información',
    'Dirección General de Planificación y Análisis Financiero',
    'Dirección General de Recaudación de Ingreso',
    'Dirección General de Recursos Humanos',
    'Dirección General de Inversiones y Valores',
    'Dirección General de Consultoría Jurídica'
  ];

  // Método para inicializar los valores del usuario
  void initialize(UserEntity user) {
    name.value = user.name;
    email.value = user.email;
    isActive.value = user.isActive;
    if (roles.contains(user.rol)) {
      rol.value = user.rol; // Asigna el rol actual si está en la lista
    } else {
      rol.value = 'USER'; // Valor predeterminado si no está en la lista
    }

    // Validar el departamento
    if (departments.contains(user.department)) {
      department.value = user.department ?? ''; // Asigna el departamento actual si está en la lista
    } else {
      department.value = ''; // Valor predeterminado si no está en la lista
    }
    position.value = user.position ?? '';
    profileImage.value = null; // La imagen se carga manualmente
  }

  // Método para obtener el usuario actualizado
  UserEntity updateUser(UserEntity originalUser) {
    return originalUser.copyWith(
      name: name.value,
      email: email.value,
      isActive: isActive.value,
      rol: rol.value,
      department: department.value.isNotEmpty ? department.value : null,
      position: position.value.isNotEmpty ? position.value : null,
      profileImage: profileImage.value?.path, // Guarda la ruta de la imagen
    );
  }

  // Método para seleccionar una imagen
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }
}