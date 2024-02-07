import 'dart:convert';
import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';
import 'package:logging/logging.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
// import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  static Future<void> sendEmail({
    required String code,
    required AccessCredentials credentials,
  }) async {
    try {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((rec) {
        log('${rec.level.name}: ${rec.time}: ${rec.message}');
      });
    } on Exception catch (e, s) {
      log('Erro ao enviar email', error: e, stackTrace: s);
    }
  }
}
