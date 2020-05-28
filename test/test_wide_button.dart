
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_training/widgets/widget_wide_button.dart';

void main() {
  group("WideButton tests", () {
    testWidgets('GIVEN an empty WideButton THEN expect an empty button structure', (WidgetTester tester) async {
      await tester.pumpWidget(WideButton());

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(RaisedButton), findsOneWidget);
    });
  });
}
