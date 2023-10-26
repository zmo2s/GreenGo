
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> isEmailValid(String email) async {
    // Ici, vous devriez effectuer une requête à la base de données pour vérifier si l'e-mail est correct.
    // Vous pouvez utiliser une bibliothèque comme http pour cela.

    // Exemple simplifié : attendez 2 secondes pour simuler une requête asynchrone.
    await Future.delayed(Duration(seconds: 2));

    // Si l'e-mail est valide dans la base de données, retournez true, sinon retournez false.
    return email == 'email_valide@example.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF8BD59E), // Vert pâle
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/images/planteoui.png', width: 100, height: 100),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Adresse Email',
                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  ),
                  style: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mot de Passe',
                    prefixIcon: Icon(Icons.lock),
                    labelStyle: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  ),
                  style: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: isEmailValid(emailController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data == true) {
                    // L'e-mail est valide dans la base de données.
                    return ElevatedButton(
                      onPressed: () {
                        // Effectuez votre logique de connexion ici.
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Connexion', style: TextStyle(fontSize: 18)),
                    );
                  } else {
                    // L'e-mail n'est pas valide dans la base de données.
                    return Text('Adresse Email non valide', style: TextStyle(color: Colors.red));
                  }
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("Vous n'avez pas de compte ? Inscrivez-vous ici", style: TextStyle(color: Color(0xFF124660)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFC7DBC2), // Vert clair
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/images/planteoui.png', width: 100, height: 100),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adresse Email',
                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  ),
                  style: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mot de Passe',
                    prefixIcon: Icon(Icons.lock),
                    labelStyle: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  ),
                  style: TextStyle(color: Color(0xFF124660)), // Bleu foncé
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fourth');
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text('Inscription', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Vous avez déjà un compte ? Connectez-vous ici", style: TextStyle(color: Color(0xFF124660)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}