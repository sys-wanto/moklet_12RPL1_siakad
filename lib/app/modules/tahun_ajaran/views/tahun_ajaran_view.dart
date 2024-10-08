import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tahun_ajaran_controller.dart';

class TahunAjaranView extends GetView<TahunAjaranController> {
  const TahunAjaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TahunAjaranView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TahunAjaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
