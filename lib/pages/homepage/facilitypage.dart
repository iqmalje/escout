import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FacilityPage extends StatefulWidget {
  const FacilityPage({super.key});

  @override
  State<FacilityPage> createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FACILITY PAGE'),
      ),
    );
  }
}
