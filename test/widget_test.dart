import 'package:flutter_test/flutter_test.dart';
import 'package:mi_portafolio/main.dart';

void main() {
  testWidgets('Carga inicial del portafolio', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Mi Portafolio'), findsOneWidget);
  });
}
