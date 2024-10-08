import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/models/model_mapel.dart';
import '../../../data/repositories/repository_mapel.dart';

class MasterKelasController extends GetxController {
  //TODO: Implement MasterKelasController

  final count = 0.obs;

  final list_test = [].obs;
  @override
  void onInit() {
    super.onInit();
    getMapel();
    list_test(
      [
        TableRow(
          children: [
            TableCell(
              child: Text('X RPL 1'),
            ),
            TableCell(
              child: Text('X'),
            ),
            TableCell(
              child: Text('RPL'),
            ),
            TableCell(
              child: Text('-'),
            ),
          ],
        )
      ],
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getMapel() async {
    var params = {
      "fields": ["name", "jenis", "guru_id", "keterangan"]
    };
    var siswa = await RepositoryMapel().loadMapel(body: params);
    print(siswa);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
