import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic getRecord(String patientId) async {
  final http.Response response = await http.post(
    'https://i71cf64rg4.execute-api.us-east-2.amazonaws.com/GetPatient',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'patient_id': patientId,
    }),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to create album.');
  }
}

class patient {
  final String patientId;
  final int statusCode;
  final String body;

  patient({this.patientId, this.body, this.statusCode});
}
