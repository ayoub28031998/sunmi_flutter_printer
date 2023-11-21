import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StubSoft/Models/UserDTO.dart';
import 'package:StubSoft/controller/AuthentificateController.dart';

import '../widgets/CartAppBar.dart';

class LoginPage extends StatelessWidget {
  final AuthentificateController authController = Get.put(AuthentificateController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    UserDTO user = UserDTO(user: username, password: password);
    authController.login(user).then((_) {
      // Traitez la suite de l'authentification ici (navigation vers une autre page, etc.)
    }).catchError((error) {
      // Gérez les erreurs d'authentification ici
      print('Erreur lors de l\'authentification: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.25, // Ajuster la taille de l'image en pourcentage de la hauteur de l'écran
                  child: Image.asset(
                    'images/stubSoft.png', // Afficher le logo
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nom d\'utilisateur',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9D0303), // Changer la couleur du bouton
                  ),
                  child: Text('Se connecter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}
