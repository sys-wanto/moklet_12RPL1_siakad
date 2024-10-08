import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/master_kelas_controller.dart';

class MasterKelasView extends GetView<MasterKelasController> {
  const MasterKelasView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasterKelasController>(
      builder: (ctx) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MASTER KELAS'),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Text('Nama Kelas'),
                        ),
                        TableCell(
                          child: Text('Jenjang'),
                        ),
                        TableCell(
                          child: Text('Jurusan'),
                        ),
                        TableCell(
                          child: Text('Keterangan'),
                        ),
                      ],
                    ),
                  ],
                ),
                Table(
                  children: [...ctx.list_test],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TableRow> tableList() {
    List<TableRow> table = [
      TableRow(children: [TableCell(child: Text(''))])
    ];
    return table;
  }
}
