import "package:http/http.dart" as http;
import '../../data/services/constant.dart';

class RepositoryLogin {
  RepositoryLogin();

  Future<http.StreamedResponse?> login({required Map<String, dynamic> body}) async {
    String url = CORS_ANYWHERE + DOMAIN;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$url/odoo_connect'),
    );

    body.forEach((key, value) {
      request.fields[key] = value;
    });

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

}
