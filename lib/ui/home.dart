import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderapp/ui/login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid = "";
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return LoginUI();
    }
    uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Welcome back User',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Your Orders"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Rewards Points"),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginUI(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          100.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Apple \nProduct",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Laptops",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Accessories",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: const Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "AirPod Iwear",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 30",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "AirPod Iwear";
                          double price = 30.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Iphone Charger",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 10",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Iphone charger";
                          double price = 10.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Power Bank",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 15",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "PowerBank 20000MAH";
                          double price = 15;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "MACBook Air",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 1500",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "MACBook Air";
                          double price = 1500.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Iphone 13 pro",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 1299",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Iphone 13 Pro";
                          double price = 1299.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Apple Watch",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 499",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Apple Watch";
                          double price = 499.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Dell Laptop",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 599",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Dell Laptop";
                          double price = 599.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Raspberry Pi 3B",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 30",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Raspberry Pi 3B";
                          double price = 30.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Center(
                        child: Text(
                          "Arduino Uno",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: const Text(
                        "USD 10",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: MaterialButton(
                        onPressed: () {
                          String name = "Arduino Uno";
                          double price = 10.0;
                          CollectionReference cart = FirebaseFirestore.instance
                              .collection("cart")
                              .doc(uid)
                              .collection("cart");
                          cart.add(
                            {
                              "name": name,
                              "price": price,
                            },
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
