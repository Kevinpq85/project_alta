import 'package:flutter/cupertino.dart';
import 'package:project_alta/Data_API/report_data.dart';

class ReportViewModel extends ChangeNotifier {
  postReport(report) async {
    await ReportApi.sendReport(report: report);
  }
}
