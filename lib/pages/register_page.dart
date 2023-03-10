import 'package:appmovil_ciclo/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Datos controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future Registrate() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), password: _passwordController.text.trim(),);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child:
            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.electric_bike,
                  size: 200,
                ),
                SizedBox(height: 25),
                Text('Registro',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 54,
                    )),
                SizedBox(height: 10),

                // email
                SizedBox(height: 50),
                Row(
                  children: [Text('         Correo electrónico')],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ejemplo@gmail.com',
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                // email
                SizedBox(height: 10),
                Row(
                  children: [Text('         Contraseña')],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "*********************",
                          prefixIcon: Icon(Icons.security, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                // Nombre completo
                SizedBox(height: 10),
                Row(
                  children: [Text('         Nombre Completo')],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Maria Belen',
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

                // Celular
                SizedBox(height: 10),
                Row(
                  children: [Text('         Celular')],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0992310235',
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                // Edad
                SizedBox(height: 10),
                Row(
                  children: [Text('         Edad')],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '21',
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

                // Register
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: Registrate,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                              "REGISTRAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ))),
                  ),
                ),

                // login "YA TIENES UNA CUENTA?/nINICIA SESION",
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'YA TIENES UNA CUENTA? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'INICIA SESION',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),

                  ],
                ),
                SizedBox(height: 10),
                // email
              ]),
            )),
      ),
    );
  }
}
