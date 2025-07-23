import 'package:flutter/material.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sponsors')),
      body: const Center(child: Text('Sponsors Page')),
    );
  }
}
