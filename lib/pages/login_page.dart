import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}): super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Datos controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            Icons.pedal_bike_rounded,
            size: 200,
          ),
          SizedBox(height: 25),
          Text('Bienvenido Ciclista',
              style: GoogleFonts.bebasNeue(
                  fontSize: 54,
              )),
          SizedBox(height: 10),
          Text('Inicia sesion para continuar'),

          // email
          SizedBox(height: 50),
          Row(
            children: [Text('         Correo electrónico')],
          ),
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
          // Loging
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      "INICIAR SESIÓN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ))),
            ),
          ),

          // Registrate
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '¿AÚN NO TIENES UNA CUENTA? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              GestureDetector(
                onTap: widget.showRegisterPage,
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),

            ],
          )
          // email
        ]),
                )),
      ),
    );
  }
}
