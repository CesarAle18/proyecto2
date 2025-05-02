import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'welcome_screen.dart';

class LoginScreen extends StatelessWidget{
    LoginScreen({super.key});
    final TextEditingController userController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    void login (BuildContext context) async {
        final username = userController.text;
        final password = passController.text;

        if(username =='admin' && password =='1234'){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => WelcomeScreen(username: 'Admin')),
            );
        } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Usuario o clave incorrectos")),
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Login')),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children:[
                        TextField(controller: userController, decoration: InputDecoration(labelText: 'Username')),
                        TextField(controller: passController, decoration: InputDecoration(labelText: 'Clave'), obscureText: true),
                        ElevatedButton(onPressed: () => login(context), child: Text('Ingresar')),
                        TextButton(
                            child: Text('Registrarse'),
                            onPressed: () {
                                Navigator.pushNamed(context, '/register');
                            },
                        ),
                    ],
                ),
            ),
        );
    }
}