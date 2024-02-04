import 'dart:convert';
import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';
import 'package:logging/logging.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

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

      const username = '';

      final oauth2token = base64Encode(
        utf8.encode(
          'user=$username\x01auth=${credentials.accessToken.type} ${credentials.accessToken.data}\x01\x01',
        ),
      );

      final smtpServer = gmailSaslXoauth2(
        username,
        oauth2token,
      );

      final message = Message()
        ..from = const Address(username, 'Luis Gustavo')
        ..recipients.add('')
        ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
        ..text = 'CÓDIGO ENVIADO $code'
        ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

      try {
        final sendReport = await send(message, smtpServer);
        log('Message sent: $sendReport');
      } on MailerException catch (e) {
        log('Message not sent.');
        for (final p in e.problems) {
          log('Problem: ${p.code}: ${p.msg}');
        }
      }
    } on Exception catch (e, s) {
      log('Erro ao enviar email', error: e, stackTrace: s);
    }
  }
}
