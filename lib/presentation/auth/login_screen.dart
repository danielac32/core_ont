import 'package:flutter/material.dart';
//import '../../core/app/routes.dart';
import 'package:get/get.dart';
import '../../infrastructure/middlewares/get_login.dart';
import '../widgets/login/custom_text_button_login.dart';





class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.primary,//Colors.grey[200], // Fondo claro
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 400), // Ancho máximo
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título
                const Text(
                  'Core System',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                   // color: colors.primary// Colors.blue,
                  ),
                ),
                const SizedBox(height: 24),

                // Campo de Email
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'ejemplo@correo.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),
                const SizedBox(height: 16),

                // Campo de Contraseña
                Obx(() => TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  obscureText: !controller.isPasswordVisible.value,
                  validator: controller.validatePassword,
                )),
                const SizedBox(height: 24),

                // Botón de Inicio de Sesión
                SizedBox(
                  width: 200, // <-- match_parent
                  height: 40,
                  child: ElevatedButton(
                    onPressed: controller.submitForm,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      shadowColor: colors.secondary//Colors.blue.withOpacity(0.5),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Opciones adicionales
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButtonLogin(text:'Registrarse',onPress:controller.register),
                    CustomTextButtonLogin(text:'Olvidé mi contraseña',onPress:(){
                      Get.snackbar('Recuperación', 'Recuperación no implementada');
                    })


                    //CustomTextButton(text:'Registrarse',onPress:(){})
                    //TextButton(
                      //  onPressed: controller.register
                      /*onPressed: () {
                        Get.toNamed("/register");
                        //Get.snackbar('Registro', 'Registro no implementado');

                     // },*/
                      //child: const Text('Registrarse'),
                    //),
                    /*TextButton(
                      onPressed: () {
                        Get.snackbar('Recuperación', 'Recuperación no implementada');
                      },
                      child: const Text('Olvidé mi contraseña'),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

