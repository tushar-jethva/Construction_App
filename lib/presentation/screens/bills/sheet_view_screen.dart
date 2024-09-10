import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:flutter/material.dart';

class MySheetViewScreen extends StatefulWidget {
  const MySheetViewScreen({
    super.key,
  });

  @override
  State<MySheetViewScreen> createState() => _MySheetViewScreenState();
}

class _MySheetViewScreenState extends State<MySheetViewScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: const Text("Sheet View"),
      ),
    );
  }
}
