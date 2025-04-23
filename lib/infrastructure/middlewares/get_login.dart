

import 'package:get/get.dart';
import 'package:flutter/material.dart';



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
  }
}

