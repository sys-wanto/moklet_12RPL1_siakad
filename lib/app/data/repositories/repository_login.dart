import "package:http/http.dart" as http;

class RepositoryLogin {
  RepositoryLogin();

  Future<http.StreamedResponse?> login({required Map<String, dynamic> body}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://cors-anywhere.herokuapp.com/http://51.79.136.232:12016/odoo_connect'),
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
