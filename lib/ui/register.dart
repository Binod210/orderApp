import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderapp/connector/FirestoreAdd.dart';
import 'package:orderapp/connector/authentication.dart';
import 'package:orderapp/ui/home.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _fullNameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order App"),
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 40.0,
                left: 20.0,
                right: 20.0,
              ),
              child: const Text("REGISTER"),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.green,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: TextFormField(
                      controller: _fullNameField,
                      decoration: const InputDecoration(
                        hintText: "John Doe",
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: TextFormField(
                      controller: _emailField,
                      decoration: const InputDecoration(
                        hintText: "someone@email.com",
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: TextFormField(
                      controller: _passwordField,
                      decoration: const InputDecoration(
                        hintText: "******",
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.green),
                    child: MaterialButton(
                      onPressed: () async {
                        bool isMove = await register(
                            _emailField.text, _passwordField.text);
                        if (isMove) {
                          await userSetup(
                              _fullNameField.text, _emailField.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(
                    20.0,
                  ),
                  child: const Text(
                    "Already Registered? Login Here",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                onTap: () {
                  // ignore: avoid_print
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
