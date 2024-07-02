import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProjectDetailsScreen extends StatefulWidget {
  const MyProjectDetailsScreen({super.key});

  @override
  State<MyProjectDetailsScreen> createState() => _MyProjectDetailsScreenState();
}

class _MyProjectDetailsScreenState extends State<MyProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBar(tabs: [
        Text("Parties"),
        Text("Building"),
        Text("Transactions"),
      ]),
    );
  }
}
