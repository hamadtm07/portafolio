import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  void _mostrarInfoRed(BuildContext context, String red, String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$red: $url'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 12),
          // Iconos de redes sociales
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'GitHub', 'github.com/hamadeltroudi'),
                tooltip: 'GitHub',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'LinkedIn', 'linkedin.com/in/hamad-el-troudi'),
                tooltip: 'LinkedIn',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.telegram, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'Telegram', '@hamad_eltroudi'),
                tooltip: 'Telegram',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'Correo', 'hamad.eltroudi@correo.unimet.edu.ve'),
                tooltip: 'Correo',
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '© 2026 Hamad El Troudi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            'Estudiante de Ingeniería de Sistemas • Proyecto Portafolio',
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Desarrollado con Flutter & Dart',
            style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
