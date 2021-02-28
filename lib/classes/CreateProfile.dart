import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic createProfile(String patientName, String phone, String address,
    String bloodGroup, String diabetes, String healthCondition) async {
  final http.Response response = await http.post(
    'https://b6s9okurpi.execute-api.us-east-2.amazonaws.com/CreatePatient',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'patient_name': patientName,
      'phone': phone,
      'address': address,
      'blood_group': bloodGroup,
      'diabetes': diabetes,
      'health_condition': healthCondition,
    }),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to create album.');
  }
}

class Profile {
  final String patientName;
  final String phone;
  final String address;
  final String bloodGroup;
  final String diabetes;
  final String healthCondition;
  final int statusCode;
  final String body;

  Profile(
      {this.patientName,
      this.phone,
      this.address,
      this.bloodGroup,
      this.diabetes,
      this.healthCondition,
      this.body,
      this.statusCode});
}
