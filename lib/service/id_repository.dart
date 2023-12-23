import 'package:shared_preferences/shared_preferences.dart'; // rememeber to import shared_preferences: ^0.5.4+8



saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('token ' + token);
  await prefs.setString('token', token);
}

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}