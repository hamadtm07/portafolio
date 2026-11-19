import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignatureScreen extends StatelessWidget {
  const SignatureScreen({super.key});

  void _copiarDato(BuildContext context, String dato) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white),
            const SizedBox(width: 8),
            Text('$dato copiado al portapapeles.'),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firma del Desarrollador'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.primary,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                        child: Text(
                          'HE',
                          style: GoogleFonts.outfit(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Hamad El Troudi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Estudiante de Ingeniería de Sistemas',
                      style: TextStyle(
                        fontSize: 15,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Universidad de Margarita (UNIMAR) • Isla de Margarita',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Text(
                      'FIRMA DIGITAL DEL AUTOR',
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.primary.withValues(alpha: 0.2),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        'Hamad El Troudi',
                        style: GoogleFonts.caveat(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Código de Verificación: #FL-2026-HT-UNIMAR',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'monospace',
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '«Certifico la autoría de esta aplicación móvil realizada para la materia Programación III, estructurada con segmentación de carpetas, temas dinámicos, navegación por rutas y buenas prácticas de Flutter.»',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.contact_mail_rounded, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        const Text(
                          'Canales de Contacto Directo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.envelope, size: 18),
                      ),
                      title: const Text('Correo Universitario'),
                      subtitle: const Text('hel_troudi.9491@unimar.edu.ve'),
                      trailing: IconButton(
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () => _copiarDato(context, 'hel_troudi.9491@unimar.edu.ve'),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.github, size: 18),
                      ),
                      title: const Text('GitHub'),
                      subtitle: const Text('https://github.com/hamadtm07'),
                      trailing: IconButton(
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () => _copiarDato(context, 'https://github.com/hamadtm07'),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.telegram, size: 18),
                      ),
                      title: const Text('Telegram Personal'),
                      subtitle: const Text('@hamadelt'),
                      trailing: IconButton(
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () => _copiarDato(context, '@hamadelt'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Volver al Portafolio', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
