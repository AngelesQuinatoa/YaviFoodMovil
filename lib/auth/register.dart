import 'package:flutter/material.dart';
import 'package:project/pages/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project/services/register.api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Color.fromARGB(255, 239, 152, 71),
                      backgroundImage: AssetImage('images/principal.jpg'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'YaviFood',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lobster',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: ThemeData(
                      primaryColor: Color(0xFFFFA07A),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: Color(0xFFFFA07A),
                      ),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Nombre',
                        labelText: 'Nombre',
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa un nombre';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: ThemeData(
                      primaryColor: Color(0xFFFFA07A),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: Color(0xFFFFA07A),
                      ),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                        suffixIcon: Icon(Icons.alternate_email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa un correo electrónico';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Por favor, ingresa un correo electrónico válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: ThemeData(
                      primaryColor: Color(0xFFFFA07A),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: Color(0xFFFFA07A),
                      ),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !isPasswordVisible,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Contraseña',
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa una contraseña';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: ThemeData(
                      primaryColor: Color(0xFFFFA07A),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: Color(0xFFFFA07A),
                      ),
                    ),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !isPasswordVisible,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'Confirmar Contraseña',
                        labelText: 'Confirmar Contraseña',
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, confirma tu contraseña';
                        } else if (value != _passwordController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: ThemeData(
                      primaryColor: Color(0xFFFFA07A),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        primary: Color(0xFFFFA07A),
                      ),
                    ),
                    child: TextFormField(
                      controller: _addressController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Dirección',
                        labelText: 'Dirección',
                        suffixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa una dirección';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text != _confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Las contraseñas no coinciden.'),
                            ),
                          );
                          return;
                        }

                        var success = await ApiService.registerUser(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confirmPasswordController.text,
                          _addressController.text,
                        );

                        if (success) {
                          print('Registro exitoso');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homePages()),
                          );
                        } else {
                          print('Error en el registro');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFA07A),
                    ),
                    child: Text('Registrar'),
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                   onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => login()),
                      );
                    },
                    child: Text(
                      '¿Ya tienes cuenta? Iniciar sesión',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
