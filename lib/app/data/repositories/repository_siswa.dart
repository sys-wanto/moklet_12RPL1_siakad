import 'dart:convert';
import "package:http/http.dart" as http;
import '../../data/services/constant.dart';

class RepositorySiswa {
  RepositorySiswa();

  loadSiswa({required Map<String, dynamic>? body}) async {
    // // Uri uri = Uri.parse('${DOMAIN}send_request?model=moklet.Siswa');
    // // var url = http.get(uri);
    // // uri.replace(queryParameters: body);
    // addCookies();

    // var res = http.Request(
    //     'GET',
    //     Uri.parse(
    //         'http://51.79.136.232:12016/send_request?model=moklet.Siswa'));
    // res.headers.addAll(defaultHeader);
    // res.body = json.encode({
    //   "fields": ["name", "jenis", "guru_id", "keterangan"]
    // });
    // http.StreamedResponse response = await res.send();
    // try {
    //   // print(response);
    //   var json = response.stream.bytesToString();
    //   print(json);
    //   return ModelSiswa(isError: true, data: [], message: 'Gagal');
    //   // if (json.containsKey('is_error')) {
    //   //   return ModelSiswa.fromJson(json);
    //   // } else {
    //   //   return ModelSiswa(isError: true, data: [], message: 'Gagal');
    //   // }
    // } catch (e) {
    //   return ModelSiswa(isError: true, data: [], message: 'Gagal');
    // }
    var headers = {
      'username': USERNAME,
      'password': PASSWORD,
      'Authorization': TOKEN,
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            DOMAIN + '/send_request?model=moklet.Siswa'));
    request.body = json.encode({
      "fields": ["name", "jenis", "guru_id", "keterangan"]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
