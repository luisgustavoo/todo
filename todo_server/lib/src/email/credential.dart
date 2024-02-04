import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart';

class Credentials {
  static Future<AuthClient> obtainAuthenticatedClient() async {
    final directory = Directory.current;

    final file = File(
      '${directory.path}/secret/serverpod-email-00fbac8e07ae.json',
    );

    final fileString = file.readAsStringSync();

    final map = jsonDecode(fileString) as Map<String, dynamic>;

    final accountCredentials = ServiceAccountCredentials.fromJson({
      'private_key_id': map['private_key_id'].toString(),
      'private_key': map['private_key'].toString(),
      'client_email': map['client_email'].toString(),
      'client_id': map['client_id'].toString(),
      'type': map['type'].toString(),
    });

    // const scopes = ['https://www.googleapis.com/auth/gmail.send'];
    const scopes = ['https://mail.google.com'];

    final client = await clientViaServiceAccount(accountCredentials, scopes);

    return client;
  }
}
