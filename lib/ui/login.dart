import 'package:flutter/material.dart';
import 'package:orderapp/connector/authentication.dart';
import 'package:orderapp/ui/home.dart';
import 'package:orderapp/ui/register.dart';

class LoginUI extends StatefulWidget {
  LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order App"),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 40.0, right: 20.0),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(
              10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: _emailField,
                    decoration: const InputDecoration(
                      hintText: "someone@email.com",
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: _passwordField,
                    decoration: const InputDecoration(
                      hintText: "*****",
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                  ),
                  child: MaterialButton(
                    child: const Text("Login"),
                    onPressed: () async {
                      bool move = await signIn(
                        _emailField.text,
                        _passwordField.text,
                      );
                      if (move) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    textColor: Colors.white,
                  ),
                )
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
                  "Don't have an account? Register Here",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onTap: () {
                // ignore: avoid_print
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
