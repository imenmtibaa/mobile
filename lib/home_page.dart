import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  int age = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Read with manna !"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Image
            Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nom d\'utilisateur",
                            hintText: "Tapez votre Nom d\'utilisateur",
                          ),
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer un nom d\'utilisateur';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Tapez votre adresse mail",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer une adresse mail';
                            } else if (!value.contains('@')) {
                              return 'Veuillez entrer une adresse mail valide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Age",
                            hintText: "Tapez votre age",
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              age = int.parse(value);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre âge';
                            } else if (int.tryParse(value) == null) {
                              return 'Veuillez entrer un nombre valide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Mot de passe",
                            hintText: "Tapez votre mot de passe",
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer un mot de passe';
                            } else if (value.length < 6) {
                              return 'Le mot de passe doit contenir au moins 6 caractères';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                createAccount(name, email, age, password);
                              }
                            },
                            child: const Text("Créez")
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  createAccount(String name, String email, int age, String password) {
    if (age < 16 && age != 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Accées impossible'),
            content: const Text('Vous devez avoir au moins 16 ans pour accéder à cette application'),
            actions: [
              // OK Button
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    if (name != "" && email != "" && age != 0 && password != "") {
      // redirect to categories page and delete the current page from the stack
      Navigator.pushNamedAndRemoveUntil(context, '/categories', (route) => false);
    }
  }
}
