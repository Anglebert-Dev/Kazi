import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kazi/main.dart';

void main() {
  testWidgets('Kazi app boots and falls back to the login screen without Firebase', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: KaziApp()));
    await tester.pump();

    expect(find.text('Welcome back'), findsOneWidget);
  });
}
