import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic createRecord(String patientId, String doctorName, String disease,
    String remarks, String medications) async {
  final http.Response response = await http.post(
    'https://wyp5iabhej.execute-api.us-east-2.amazonaws.com/CreateRecord',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'patient_id': patientId,
      'doctor_name': doctorName,
      'disease': disease,
      'remarks': remarks,
      'medications': medications
    }),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to create album.');
  }
}

class Record {
  final String patientId;
  final String doctorName;
  final String disease;
  final String remarks;
  final String medications;
  final int statusCode;
  final String body;

  Record(
      {this.patientId,
      this.doctorName,
      this.disease,
      this.remarks,
      this.medications,
      this.body,
      this.statusCode});
}
