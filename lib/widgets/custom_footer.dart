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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'GitHub', 'github.com/hamadtm07'),
                tooltip: 'GitHub',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.telegram, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'Telegram', '@hamadelt'),
                tooltip: 'Telegram',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope, size: 20),
                onPressed: () => _mostrarInfoRed(context, 'Correo', 'hel_troudi.9491@unimar.edu.ve'),
                tooltip: 'Correo',
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            '© 2026 Hamad El Troudi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            'Ingeniería de Sistemas • Universidad de Margarita (UNIMAR)',
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
