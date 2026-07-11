import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kazi/main.dart';

void main() {
  testWidgets('Kazi app boots and shows the placeholder home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: KaziApp()));

    expect(find.text('Kazi'), findsOneWidget);
  });
}
