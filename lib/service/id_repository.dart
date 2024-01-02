import 'package:shared_preferences/shared_preferences.dart'; // rememeber to import shared_preferences: ^0.5.4+8



saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('token ' + token);
  await prefs.setString('token', token);
}

Future<String> getToken() async {
  print('getting token..');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('fetched token is: ' + prefs.getString('token').toString());

  return Future<String>.value(prefs.getString('token'));
}