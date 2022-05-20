import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_alta/Model/report_model.dart';

class ReportApi {
  static Future sendReport({ReportModel? report}) async {
    try {
      var response =
          await Dio().post("https://api.emailjs.com/api/v1.0/email/send",
              options: Options(headers: {
                'origin': 'http://localhost',
                'Content-Type': 'application/json',
              }),
              data: jsonEncode({
                'service_id': 'service_ukmjgxu',
                'template_id': 'template_jed70il',
                'user_id': '0UrrU7j95xfRRHcp-',
                'template_params': report
              }));
      return response;
    } on Exception catch (_) {
      throw Exception("Failed Post");
    }
  }
}
