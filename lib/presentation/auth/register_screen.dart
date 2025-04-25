import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../infrastructure/middlewares/get_register.dart';
import '../widgets/register/custom_button_register.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final RegisterController controller = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 600), // Ancho máximo
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
              children: [
                const Text(
                  'Crear Usuario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // color: colors.primary// Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.nameController,
                    decoration:InputDecoration(
                      labelText: "Usuario",
                      hintText: 'Nombre y apallido',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  keyboardType: TextInputType.text,
                  validator: controller.validateName,
                ),
                const SizedBox(height: 24),
                TextFormField(
                    controller: controller.emailController,
                    decoration:InputDecoration(
                        labelText: "Correo",
                        hintText: 'ejemplo@correo.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  keyboardType: TextInputType.text,
                  validator: controller.validateEmail,
                ),
                const SizedBox(height: 24),

                Obx(() {
                  return DropdownButtonFormField<String>(
                    value: controller.opcionSeleccionadaDir.value,// == null ? null : controller.opcionSeleccionadaDir.value,
                    hint: Text('Dirección'),
                    onChanged: (String? newValue) {
                      controller.cambiarSeleccionDir(newValue);
                    },
                    decoration: InputDecoration(
                      labelText: "Dirección",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    ),
                    items: controller.Direcciones.map((String opcion) {
                      return DropdownMenuItem<String>(
                        value: opcion,
                        child: Text(opcion),
                      );
                    }).toList(),
                  );
                }),

                const SizedBox(height: 24),
            Obx(() =>TextFormField(
                  controller: controller.passwordController,
                    decoration:InputDecoration(
                      labelText: "Contraseña",
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

                Obx(() =>TextFormField(
                  controller: controller.passwordController2,
                  decoration:InputDecoration(
                    labelText: "Repita la Contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility2,
                    ),
                  ),
                  obscureText: !controller.isPasswordVisible2.value,
                  validator: controller.validatePassword,
                )),
                const SizedBox(height: 24),

                Obx(() {
                  return DropdownButtonFormField<String>(
                    value: controller.opcionSeleccionadaRol.value,// == null ? null : controller.opcionSeleccionadaDir.value,
                    hint: Text('Rol'),
                    onChanged: (String? newValue) {
                      controller.cambiarSeleccionRol(newValue);
                    },
                    decoration: InputDecoration(
                      labelText: "Rol",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    ),
                    items: controller.Rol.map((String opcion) {
                      return DropdownMenuItem<String>(
                        value: opcion,
                        child: Text(opcion),
                      );
                    }).toList(),
                  );
                }),

                const SizedBox(height: 24),
               /* CustomButtonWidgetRegister(text:"Volver",onPress:(){
                  Get.back();
                }),
                CustomButtonWidgetRegister(text:"Crear",onPress: controller.submitForm)*/
                Buttons(colors: colors, controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.colors,
    required this.controller,
  });

  final ColorScheme colors;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CustomButtonWidgetRegister(text:"Volver",onPress:(){
          Get.back();
        }),
        const SizedBox(width: 20),
        CustomButtonWidgetRegister(text:"Crear",onPress: controller.submitForm)

        /*SizedBox(
          width: 100, // <-- match_parent
          height: 30,
          child: ElevatedButton(
            onPressed: (){
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                shadowColor: colors.secondary//Colors.blue.withOpacity(0.5),
            ),
            child: const Text(
              'volver',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 100, // <-- match_parent
          height: 30,
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
              'Crear',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),*/
      ],
    );
  }
}


