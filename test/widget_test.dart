// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedarik/widgets/login.dart';

void main() {
  testWidgets('column widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fcolumn = find.byType(Column);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fcolumn, findsNWidgets(3));
  });

  testWidgets('row widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final frow = find.byType(Row);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(frow, findsNWidgets(0));
  });

  testWidgets('positioned widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fpos = find.byType(Positioned);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fpos, findsNWidgets(4));
  });

  testWidgets('text widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final ftext = find.byType(Text);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(ftext, findsNWidgets(5));
  });

  testWidgets('sizedbox widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fsized = find.byType(SizedBox);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fsized, findsNWidgets(4));
  });

  testWidgets('container widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fcon = find.byType(Container);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fcon, findsNWidgets(9));
  });

  testWidgets('padding widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fpad = find.byType(Padding);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fpad, findsNWidgets(11));
  });

  testWidgets('stack widget count', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    final fstack = find.byType(Stack);

    await tester.pump(const Duration(milliseconds: 2000));

    expect(fstack, findsNWidgets(2));
  });
}
