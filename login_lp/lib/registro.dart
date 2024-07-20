import 'package:app_autenticacion/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_autenticacion/autenticacion.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final namecontroller = TextEditingController();
final apellidocontroller = TextEditingController();
final confirmpasswordcontroller = TextEditingController();
final telfonocontroller = TextEditingController();
final formKey = GlobalKey<FormState>();

class Registro extends StatelessWidget {
  const Registro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crea tu nueva cuenta'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 108, 170, 221),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.Bienvenida.name);
            namecontroller.clear();
            apellidocontroller.clear();
            emailController.clear();
            telfonocontroller.clear();
            passwordController.clear();
            confirmpasswordcontroller.clear();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Registrate',
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      controller: namecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El campo nombre es obligatorio';
                        } else if (value.length < 3) {
                          return 'El nombre debe de tener mas de 3 digitos';
                        }
                        return null;
                      },
                      tamMax: 10,
                      obscureText: false,
                      labelText: 'Nombre',
                      prefixIcon: const Icon(Icons.person_2),
                      bordes: const OutlineInputBorder(),
                    ),
                    CustomInput(
                      controller: apellidocontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El campo Apellido es obligatorio';
                        } else if (value.length < 3) {
                          return 'El apellido debe de tener mas de 3 digitos';
                        }

                        return null;
                      },
                      tamMax: 20,
                      obscureText: false,
                      labelText: 'Apellido',
                      prefixIcon: const Icon(Icons.person_2),
                      bordes: const OutlineInputBorder(),
                    ),
                    CustomInput(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'El campo email es obligatorio';
                        }
                        if (!value.contains('@') ||
                            !value.contains('.edu.hn')) {
                          return 'El formato del correo electrónico es incorrecto';
                        }
                        return null;
                      },
                      obscureText: false,
                      tamMax: 30,
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email_rounded),
                      bordes: const OutlineInputBorder(),
                    ),
                    CustomInput(
                      controller: telfonocontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su número de celular';
                        } else if (value.length > 8) {
                          return 'El número de celular no puede tener más de 8 dígitos';
                        } else if (!(value.startsWith('3') ||
                            value.startsWith('9'))) {
                          return 'El número de celular debe comenzar con 3 o 9';
                        }

                        return null;
                      },
                      obscureText: false,
                      tamMax: 20,
                      labelText: 'Telefono',
                      prefixIcon: const Icon(Icons.phone_iphone),
                      bordes: const OutlineInputBorder(),
                    ),
                    CustomInput(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese una contraseña';
                        }
                        if (value.length < 8) {
                          return 'La contraseña debe tener al menos 8 caracteres';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'La contraseña debe contener al menos una mayúscula';
                        }
                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'La contraseña debe contener al menos un carácter especial';
                        }
                        return null;
                      },
                      obscureText: true,
                      tamMax: 20,
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      bordes: const OutlineInputBorder(),
                    ),
                    CustomInput(
                      controller: confirmpasswordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese una contraseña';
                        }
                        if (value.length < 8) {
                          return 'La contraseña debe tener al menos 8 caracteres';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'La contraseña debe contener al menos una mayúscula';
                        }
                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'La contraseña debe contener al menos un carácter especial';
                        }
                        return null;
                      },
                      obscureText: true,
                      labelText: 'Contraseña',
                      tamMax: 20,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      bordes: const OutlineInputBorder(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Registrate'),
                        ],
                      ),
                      onPressed: () {
                        final password = passwordController.text;
                        final confirm = confirmpasswordcontroller.text;

                        if (formKey.currentState!.validate()) {
                          if (password == confirm) {
                            print(
                              'Registro de cuenta valido',
                            );
                            print(namecontroller.text);
                            print(apellidocontroller.text);
                            print(emailController.text);
                            print(telfonocontroller.text);
                            print(passwordController.text);
                            const Text('Se ha registrado correctamente');

                            Navigator.pushReplacementNamed(
                                context, MyRoutes.inicio.name);
                            namecontroller.clear();
                            apellidocontroller.clear();
                            emailController.clear();
                            telfonocontroller.clear();
                            passwordController.clear();
                            confirmpasswordcontroller.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Las contraseñas ingresadas no coinciden')));
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
