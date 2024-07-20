import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_lp/routas.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final nameController = TextEditingController();
final apellidoController = TextEditingController();
final confirmPasswordController = TextEditingController();
final telefonoController = TextEditingController();
final formKey = GlobalKey<FormState>();

class Registro extends StatelessWidget {
  const Registro({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crea tu nueva cuenta'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MyRoutes.bienvenida.name);
            nameController.clear();
            apellidoController.clear();
            emailController.clear();
            telefonoController.clear();
            passwordController.clear();
            confirmPasswordController.clear();
          },
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Regístrate',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo nombre es obligatorio';
                              } else if (value.length < 3) {
                                return 'El nombre debe de tener más de 3 dígitos';
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
                            keyboardType: TextInputType.name,
                            controller: apellidoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo apellido es obligatorio';
                              } else if (value.length < 3) {
                                return 'El apellido debe de tener más de 3 dígitos';
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
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo email es obligatorio';
                              }
                              if (!value.contains('@') || !value.contains('.edu.hn')) {
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
                            keyboardType: TextInputType.phone,
                            controller: telefonoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su número de celular';
                              } else if (value.length != 8) {
                                return 'El número de celular debe tener 8 dígitos';
                              } else if (!(value.startsWith('3') || value.startsWith('9'))) {
                                return 'El número de celular debe comenzar con 3 o 9';
                              }
                              return null;
                            },
                            obscureText: false,
                            tamMax: 8,
                            labelText: 'Teléfono',
                            prefixIcon: const Icon(Icons.phone_iphone),
                            bordes: const OutlineInputBorder(),
                          ),
                          CustomInput(
                            keyboardType: TextInputType.visiblePassword,
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
                              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
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
                            keyboardType: TextInputType.visiblePassword,
                            controller: confirmPasswordController,
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
                              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                return 'La contraseña debe contener al menos un carácter especial';
                              }
                              return null;
                            },
                            obscureText: true,
                            labelText: 'Confirmar Contraseña',
                            tamMax: 20,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              final password = passwordController.text;
                              final confirm = confirmPasswordController.text;

                              if (formKey.currentState!.validate()) {
                                if (password == confirm) {
                                  print('Registro de cuenta válido');
                                  print('Nombre: ${nameController.text}');
                                  print('Apellido: ${apellidoController.text}');
                                  print('Email: ${emailController.text}');
                                  print('Teléfono: ${telefonoController.text}');
                                  print('Contraseña: $password');
                                  print('Se ha registrado correctamente');

                                  Navigator.pushReplacementNamed(context, MyRoutes.inicio.name,arguments: {'email':emailController.text,
                                  'password': passwordController.text});
                                  nameController.clear();
                                  apellidoController.clear();
                                  emailController.clear();
                                  telefonoController.clear();
                                  passwordController.clear();
                                  confirmPasswordController.clear();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Las contraseñas ingresadas no coinciden')),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, minimumSize: const Size(175, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Registrarse'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

typedef Validator = String? Function(String?);

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  CustomInput({
    super.key,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.tamMax,
    this.bordes,
    required TextInputType keyboardType ,
  });

  final TextEditingController controller;
  bool obscureText;
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final Validator validator;
  final int? tamMax;
  final InputBorder? bordes;
  
  get keyboardType => null;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      maxLength: widget.tamMax,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        border: widget.bordes,
      ),
    );
  }
}

