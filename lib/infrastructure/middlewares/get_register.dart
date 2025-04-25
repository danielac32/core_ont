import 'package:get/get.dart';
import 'package:flutter/material.dart';



class RegisterController extends GetxController {

  List<String> Direcciones = [
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
  final List<String> Rol = [
    'USER',
    'ADMIN',
  ];
  // Variable reactiva para la opción seleccionada
  var opcionSeleccionadaDir = Rx<String?>(null);
  var opcionSeleccionadaRol = Rx<String?>(null);

  void cambiarSeleccionRol(String? nuevaSeleccion) {
    opcionSeleccionadaRol.value = nuevaSeleccion;
  }
  // Método para actualizar la selección
  void cambiarSeleccionDir(String? nuevaSeleccion) {
    opcionSeleccionadaDir.value = nuevaSeleccion;
  }
/****************************************************************/
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final direccionController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final rolController = TextEditingController();



  // Estado para mostrar/ocultar la contraseña
  var isPasswordVisible = false.obs;

  // Método para alternar la visibilidad de la contraseña
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var isPasswordVisible2 = false.obs;

  // Método para alternar la visibilidad de la contraseña
  void togglePasswordVisibility2() {
    isPasswordVisible2.value = !isPasswordVisible2.value;
  }


  String? validateName(String? value) {
    // Verifica si el valor es null o está vacío
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu nombre';
    }

    // Verifica si el texto tiene al menos un número mínimo de caracteres (ejemplo: 5)
    if (value.trim().length < 5) {
      return 'El nombre debe tener al menos 5 caracteres';
    }

    // Verifica si el texto contiene exactamente dos palabras
    final words = value.trim().split(RegExp(r'\s+')); // Divide el texto por espacios
    if (words.length != 2) {
      return 'El nombre debe contener exactamente dos palabras';
    }

    // Si pasa todas las validaciones, retorna null (sin errores)
    return null;
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


  void submitForm() {
    // Validar el campo de nombre
    final nameValidation = validateName(nameController.text);
    if (nameValidation != null) {
      Get.snackbar('Error', nameValidation);
      return;
    }

    // Validar el campo de email
    final emailValidation = validateEmail(emailController.text);
    if (emailValidation != null) {
      Get.snackbar('Error', emailValidation);
      return;
    }

    // Validar el campo de dirección
    if (opcionSeleccionadaDir.value == null || opcionSeleccionadaDir.value!.isEmpty) {
      Get.snackbar('Error', 'Por favor, selecciona una dirección');
      return;
    }

    final passwordValidation = validatePassword(passwordController.text);
    if (passwordValidation != null) {
      Get.snackbar('Error', passwordValidation);
      return;
    }

    final passwordValidation2 = validatePassword(passwordController2.text);
    if (passwordValidation2 != null) {
      Get.snackbar('Error', passwordValidation2);
      return;
    }

    if (opcionSeleccionadaRol.value == null || opcionSeleccionadaRol.value!.isEmpty) {
      Get.snackbar('Error', 'Por favor, selecciona un Rol');
      return;
    }

    // Si todas las validaciones pasan, mostrar mensaje de éxito
    Get.snackbar('Inicio de Sesión', 'Inicio de sesión exitoso');
  }


}
