

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/enum.dart';
import '../../domain/entities/user.dart';



class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Estado para mostrar/ocultar la contraseña
  var isPasswordVisible = false.obs;

  // Método para alternar la visibilidad de la contraseña
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Validación del formulario
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu contraseña';
    } else if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void register(){
    Get.toNamed("/register");
  }

  // Método para enviar el formulario
  void submitForm() {
    if (validateEmail(emailController.text) == null &&
        validatePassword(passwordController.text) == null) {
      Get.snackbar('Inicio de Sesión', 'Inicio de sesión exitoso');
    } else {
      Get.snackbar('Error', 'Por favor, corrige los errores en el formulario');
    }

    final newUser = UserEntity(
      id: 1,
      name: 'Astrid Quintero',
      email: 'danielquinteroac32@gmail.com',
      password: 'ac32mqn42',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      department: Directorate.generalInformationTechnology.label,
      profileImage: 'https://example.com/profile.jpg',
      position: Position.COORDINADOR.label,//'Coordinador',
      rol: Role.ADMIN.label
    );
    Get.toNamed("/admin",arguments:newUser);
  }
}

