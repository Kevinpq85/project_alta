import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_alta/View/Report/report_screen.dart';
import 'package:project_alta/View/Report/report_view_model.dart';
import 'package:provider/provider.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();
  group('Report Screen', () {
    testWidgets('Judul harus Report Screen', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ReportViewModel(),
          child: const MaterialApp(home: ReportScreen(judul: "Judul Resep"))));
      await tester.pumpAndSettle();
      expect(find.text("Report Screen"), findsOneWidget);
    });

    testWidgets('Harus Judul Resep', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ReportViewModel(),
          child: const MaterialApp(home: ReportScreen(judul: "Judul Resep"))));
      await tester.pumpAndSettle();
      expect(find.text("Judul Resep"), findsOneWidget);
    });
    testWidgets(
        'Harus memiliki 3 field untuk mengumpulkan nama, email, dan pesan, lalu tampilkan pesan ketika pengguna tidak mengisi field setelah mengirim',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ReportViewModel(),
          child: const MaterialApp(home: ReportScreen(judul: "Judul Resep"))));

      expect(find.byKey(const Key("name_field")), findsOneWidget);
      expect(find.byKey(const Key("email_field")), findsOneWidget);
      expect(find.byKey(const Key("message_field")), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.text("Form nama tidak boleh kosong"), findsOneWidget);
      expect(find.text("Form email tidak boleh kosong"), findsOneWidget);
      expect(find.text("Form pesan tidak boleh kosong"), findsOneWidget);
    });

    testWidgets(
        'validator mengembalikkan null ketika user mengisi field setelah mengklik submit',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => ReportViewModel(),
          child: const MaterialApp(home: ReportScreen(judul: "Judul Resep"))));

      await tester.enterText(find.byKey(const ValueKey("name_field")), "Pedro");
      await tester.enterText(
          find.byKey(const ValueKey("email_field")), "test@gmail.com");
      await tester.enterText(find.byKey(const ValueKey("message_field")),
          "pada resep Beef and Mustard Pie tidak bisa menampilkan resep");

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.text("Form nama tidak boleh kosong"), findsNothing);
      expect(find.text("Form email tidak boleh kosong"), findsNothing);
      expect(find.text("Form pesan tidak boleh kosong"), findsNothing);
    });
  });
}
