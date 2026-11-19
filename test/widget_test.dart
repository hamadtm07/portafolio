import 'package:flutter_test/flutter_test.dart';
import 'package:mi_portafolio/main.dart';

void main() {
  testWidgets('Carga inicial del portafolio', (WidgetTester tester) async {
    // Construir la aplicación y renderizar el primer frame
    await tester.pumpWidget(const MyApp());

    // Verificar que el título del AppBar esté presente
    expect(find.text('Mi Portafolio'), findsOneWidget);
  });
}
