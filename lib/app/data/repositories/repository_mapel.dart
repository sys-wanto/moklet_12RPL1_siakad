import 'dart:convert';
import "package:http/http.dart" as http;
import '../../data/models/model_mapel.dart';
import '../../data/services/constant.dart';

class RepositoryMapel {
  RepositoryMapel();

  loadMapel({required Map<String, dynamic>? body}) async {
    // // Uri uri = Uri.parse('${DOMAIN}send_request?model=moklet.mapel');
    // // var url = http.get(uri);
    // // uri.replace(queryParameters: body);
    // addCookies();

    // var res = http.Request(
    //     'GET',
    //     Uri.parse(
    //         'http://51.79.136.232:12016/send_request?model=moklet.mapel'));
    // res.headers.addAll(defaultHeader);
    // res.body = json.encode({
    //   "fields": ["name", "jenis", "guru_id", "keterangan"]
    // });
    // http.StreamedResponse response = await res.send();
    // try {
    //   // print(response);
    //   var json = response.stream.bytesToString();
    //   print(json);
    //   return ModelMapel(isError: true, data: [], message: 'Gagal');
    //   // if (json.containsKey('is_error')) {
    //   //   return ModelMapel.fromJson(json);
    //   // } else {
    //   //   return ModelMapel(isError: true, data: [], message: 'Gagal');
    //   // }
    // } catch (e) {
    //   return ModelMapel(isError: true, data: [], message: 'Gagal');
    // }
    var headers = {
      'username': 'admin',
      'password': '123456',
      'Authorization': '0405f143-c1db-49bb-ab26-22e74977a869',
      'Content-Type': 'application/json',
      'Cookie': 'session_id=43cb5053e6297c41171a295f62e064ac126b60ef'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://cors-anywhere.herokuapp.com/http://51.79.136.232:12016/send_request?model=moklet.mapel'));
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
