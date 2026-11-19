import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mi_portafolio/models/comment_model.dart';
import 'package:mi_portafolio/models/hobby_model.dart';
import 'package:mi_portafolio/models/project_model.dart';
import 'package:mi_portafolio/routes/app_routes.dart';
import 'package:mi_portafolio/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<CommentModel> _comentarios = [
    const CommentModel(
      author: 'Prof. Héctor',
      email: 'prof.hector@correo.edu.ve',
      message: 'Excelente estructura del proyecto y buena aplicación de widgets y temas.',
      date: '18 Nov 2026',
    ),
    const CommentModel(
      author: 'Abdul Aboujokh',
      email: 'abdul.aboujokh@unimar.edu.ve',
      message: 'البورتفوليو طالع ممتاز يا خوي، الواجهة مرتبة ونظيفة كتير.',
      date: '15 Nov 2026',
    ),
  ];

  void _agregarComentario(CommentModel nuevoComentario) {
    setState(() {
      _comentarios.insert(0, nuevoComentario);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final views = [
      const _AboutView(),
      const _WhatIDoView(),
      const _HobbiesView(),
      _CommentsView(
        comentarios: _comentarios,
        onNuevoComentario: _agregarComentario,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Portafolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.badge_outlined),
            tooltip: 'Firma del Desarrollador',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.signatureRoute);
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: views,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withValues(alpha: 0.06),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: GNav(
              rippleColor: theme.colorScheme.primary.withValues(alpha: 0.2),
              hoverColor: theme.colorScheme.primary.withValues(alpha: 0.1),
              gap: 6,
              activeColor: theme.colorScheme.primary,
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
              color: isDark ? Colors.grey[400] : Colors.grey[700],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.person_rounded,
                  text: 'Sobre Mí',
                ),
                GButton(
                  icon: Icons.code_rounded,
                  text: '¿Qué hago?',
                ),
                GButton(
                  icon: Icons.sports_esports_rounded,
                  text: 'Hobbies',
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  text: 'Comentarios',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutView extends StatelessWidget {
  const _AboutView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              radius: 54,
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
              child: const Icon(
                Icons.person_rounded,
                size: 64,
                color: Color(0xFF0F766E),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Hamad El Troudi',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Estudiante de Ingeniería de Sistemas',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signatureRoute);
                },
                icon: const Icon(Icons.verified_user_rounded, size: 18),
                label: const Text('Ver Firma'),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Correo: hel_troudi.9491@unimar.edu.ve'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.mail_outline_rounded, size: 18),
                label: const Text('Contactar'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle_rounded, color: theme.colorScheme.primary),
                      const SizedBox(width: 10),
                      const Text(
                        '¿Quién soy?',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '¡Hola! Soy Hamad El Troudi, estudiante de Ingeniería de Sistemas en la Universidad de Margarita (UNIMAR). Me apasiona la tecnología y aprender a programar aplicaciones móviles y web mientras avanzo en mi carrera.',
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Actualmente estoy cursando la materia Programación III, aprendiendo el desarrollo con Flutter y Dart, y practicando con proyectos sencillos y bien organizados.',
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school_rounded, color: theme.colorScheme.primary),
                      const SizedBox(width: 10),
                      const Text(
                        'Datos Académicos',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const _ItemDato(
                    icono: Icons.apartment_rounded,
                    titulo: 'Universidad',
                    valor: 'Universidad de Margarita (UNIMAR)',
                  ),
                  const _ItemDato(
                    icono: Icons.menu_book_rounded,
                    titulo: 'Carrera',
                    valor: 'Ingeniería de Sistemas',
                  ),
                  const _ItemDato(
                    icono: Icons.computer_rounded,
                    titulo: 'Materia',
                    valor: 'Programación III (Flutter & Dart)',
                  ),
                  const _ItemDato(
                    icono: Icons.translate_rounded,
                    titulo: 'Idiomas',
                    valor: 'Español (Nativo), Inglés',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const CustomFooter(),
        ],
      ),
    );
  }
}

class _ItemDato extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String valor;

  const _ItemDato({
    required this.icono,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                Text(
                  valor,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatIDoView extends StatelessWidget {
  const _WhatIDoView();

  static const List<ProjectModel> _listaProyectos = [
    ProjectModel(
      title: 'Bookea Mobile',
      tag: 'Proyecto Universitario',
      description: 'Plataforma para la reserva y gestión de espacios de estudio, cubículos y salas en la universidad.',
      imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&auto=format&fit=crop&q=80',
      technologies: ['Flutter', 'Node.js', 'PostgreSQL', 'Supabase'],
    ),
    ProjectModel(
      title: 'Soma Studio App',
      tag: 'Proyecto Móvil',
      description: 'Aplicación para la gestión de turnos, horarios y control de usuarios para un estudio deportivo.',
      imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=600&auto=format&fit=crop&q=80',
      technologies: ['Flutter', 'Dart', 'Firebase'],
    ),
  ];

  static const List<Map<String, dynamic>> _habilidades = [
    {'nombre': 'Flutter & Dart', 'nivel': 'Básico / Intermedio', 'icono': Icons.phone_android_rounded},
    {'nombre': 'Python', 'nivel': 'Intermedio', 'icono': Icons.terminal_rounded},
    {'nombre': 'C#', 'nivel': 'Intermedio', 'icono': Icons.code_rounded},
    {'nombre': 'Bases de Datos (SQL)', 'nivel': 'Intermedio', 'icono': Icons.storage_rounded},
    {'nombre': 'Git & GitHub', 'nivel': 'Intermedio', 'icono': Icons.source_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Qué hago?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Proyectos de la carrera y herramientas que estoy aprendiendo en la universidad.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Text(
            'Habilidades y Lenguajes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _habilidades.map((hab) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(hab['icono'] as IconData, size: 18, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      hab['nombre'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Proyectos Realizados',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          ..._listaProyectos.map((proyecto) => CustomCardProject(project: proyecto)),
          const SizedBox(height: 10),
          const CustomFooter(),
        ],
      ),
    );
  }
}

class _HobbiesView extends StatelessWidget {
  const _HobbiesView();

  static const List<HobbyModel> _hobbies = [
    HobbyModel(
      title: 'Fútbol',
      category: 'Deporte',
      description: 'Me gusta jugar partidos con amigos los fines de semana y ver los juegos de las ligas principales.',
      icon: Icons.sports_soccer_rounded,
      accentColor: Colors.green,
    ),
    HobbyModel(
      title: 'Videojuegos de PC',
      category: 'Gaming',
      description: 'En mis tiempos libres juego en la computadora, principalmente Counter-Strike 2 y GTA V Online.',
      icon: Icons.sports_esports_rounded,
      accentColor: Colors.deepPurple,
    ),
    HobbyModel(
      title: 'Música',
      category: 'Pasatiempo',
      description: 'Suelo escuchar reggaetón y rock nacional para relajarme y cuando estoy frente a la computadora.',
      icon: Icons.music_note_rounded,
      accentColor: Colors.teal,
    ),
    HobbyModel(
      title: 'Entrenar',
      category: 'Salud',
      description: 'Hacer ejercicio y mantenerme activo para despejar la mente del estudio universitario.',
      icon: Icons.fitness_center_rounded,
      accentColor: Colors.redAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mis Hobbies e Intereses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Las cosas que me gusta hacer fuera del horario de clases.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 18),
          ..._hobbies.map((hobby) => CustomCardHobby(hobby: hobby)),
          const SizedBox(height: 10),
          const CustomFooter(),
        ],
      ),
    );
  }
}

class _CommentsView extends StatefulWidget {
  final List<CommentModel> comentarios;
  final Function(CommentModel) onNuevoComentario;

  const _CommentsView({
    required this.comentarios,
    required this.onNuevoComentario,
  });

  @override
  State<_CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<_CommentsView> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _mensajeController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _mensajeController.dispose();
    super.dispose();
  }

  void _enviarComentario() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final nuevoComentario = CommentModel(
      author: _nombreController.text.trim(),
      email: _correoController.text.trim(),
      message: _mensajeController.text.trim(),
      date: 'Hoy',
    );

    widget.onNuevoComentario(nuevoComentario);

    _nombreController.clear();
    _correoController.clear();
    _mensajeController.clear();

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.teal.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: const Row(
          children: [
            Icon(Icons.check_circle_outline_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text('¡Comentario publicado exitosamente!'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sección de Comentarios',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Deja un mensaje o comentario de feedback sobre esta aplicación o para ponerte en contacto.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nuevo Comentario',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      labelText: 'Nombre Completo',
                      hintText: 'Ingresa tu nombre',
                      icon: Icons.person_outline_rounded,
                      textController: _nombreController,
                    ),
                    CustomInput(
                      labelText: 'Correo Electrónico',
                      hintText: 'ejemplo@correo.com',
                      icon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                      textController: _correoController,
                    ),
                    CustomInput(
                      labelText: 'Tu Comentario / Mensaje',
                      hintText: 'Escribe aquí tu opinión...',
                      icon: Icons.comment_outlined,
                      maxLines: 3,
                      textController: _mensajeController,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: _enviarComentario,
                        icon: const Icon(Icons.send_rounded, size: 20),
                        label: const Text('Publicar Comentario', style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.forum_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Comentarios Recientes (${widget.comentarios.length})',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.comentarios.map((c) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                  child: Text(
                    c.author.isNotEmpty ? c.author[0].toUpperCase() : '?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(c.author, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(c.date, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(c.message),
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          const CustomFooter(),
        ],
      ),
    );
  }
}
