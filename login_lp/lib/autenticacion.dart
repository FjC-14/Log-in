import 'package:flutter/material.dart';
import 'package:login_lp/routas.dart';

final emailController = TextEditingController();

class Autenticacion extends StatelessWidget {
  Autenticacion({super.key});

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Map<String?, String?>? args=ModalRoute.of(context)?.settings.arguments as Map<String?, String?>?;
    args?.putIfAbsent('email', () => 'usuario@unah.edu.hn');
    args?.putIfAbsent('password', () => 'Contraseña*');
    final String? savedEmail = args?['email'];
    final String? savedPassword = args?['password'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            emailController.clear();
            Navigator.pushReplacementNamed(context, MyRoutes.bienvenida.name, arguments: {'email' : emailController.text});
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
                            '¡Bienvenido de vuelta!',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 20),
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
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            obscureText: false,
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El campo contraseña es obligatorio';
                              }
                              if (value.length < 8) {
                                return 'Por favor ingrese una contraseña válida';
                              }
                              return null;
                            },
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                            obscureText: true,
                            bordes: const OutlineInputBorder(),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if ((emailController.text == savedEmail &&
                                    passwordController.text == savedPassword)|| (emailController.text=='usuario@unah.edu.hn' 
                                    && passwordController.text== 'Contraseña*')) {
                                  Navigator.pushReplacementNamed(context, MyRoutes.pantallafinal.name);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('El email o la contraseña son incorrectos'),
                                    ),
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
                                Text('Iniciar sesión'),
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
    required TextInputType keyboardType,
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
