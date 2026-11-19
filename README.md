# 📱 Portafolio Personal - Flutter

**Proyecto Evaluativo de Portafolio Personal** para la asignatura **Programación III** (Período Septiembre 2026).  
Desarrollado por **Hamad El Troudi**, estudiante de Ingeniería de Sistemas en la Universidad de Margarita (UNIMAR).

---

## 🎯 Objetivo del Proyecto

Crear una aplicación móvil funcional a modo de portafolio personal utilizando **Flutter & Dart**. El proyecto demuestra los conocimientos fundamentales adquiridos en clases sobre interfaces de usuario, segmentación de carpetas, temas visuales, navegación por rutas nombradas y validación de formularios bajo el principio **KISS (Keep It Simple, Stupid)**.

---

## 🚀 Secciones de la Aplicación

La aplicación se encuentra organizada en vistas fluidas integradas con una barra de navegación inferior (`GoogleNavBar`), más una pantalla independiente accesible desde el `AppBar`:

### 1. 👤 Sobre mí / ¿Quién soy?
- **Avatar de perfil** con diseño circular.
- **Biografía personal**: Presentación como estudiante de Ingeniería de Sistemas de la UNIMAR.
- **Ficha académica**: Universidad de Margarita (UNIMAR), carrera, materia e idiomas.
- **Botones de acción**: Acceso directo a la firma de desarrollador y contacto por correo.

### 2. 💻 ¿Qué hago? (Habilidades & Proyectos)
- **Habilidades y Lenguajes**: Flutter & Dart, Python, C#, Bases de Datos (SQL) y Git.
- **Tarjetas de Proyectos (`CustomCardProject`)**:
  - Implementación de `FadeInImage` con placeholder local animado (`assets/jar-loading.gif`).
  - Proyectos universitarios destacados: *Bookea Mobile* y *Soma Studio App*.
  - Botón interactivo *"Ver Detalles"* que despliega un diálogo (`AlertDialog`) con las tecnologías empleadas.

### 3. 🎮 Hobbies e Intereses
- **Fútbol**: Jugar partidos con amigos los fines de semana y ver los juegos de las ligas principales.
- **Videojuegos de PC**: Partidas de Counter-Strike 2 y GTA V Online en la computadora.
- **Música**: Escuchar géneros como reggaetón y rock nacional venezolano.
- **Entrenar**: Gimnasio y ejercicio físico para mantenerse activo.

### 4. 💬 Sección de Comentarios
- **Formulario Interactivo** para dejar comentarios o sugerencias.
- Campos con validación:
  - Nombre completo.
  - Correo electrónico (validación de formato de email).
  - Mensaje (multilínea).
- Lista de comentarios con aportes precargados (Prof. Héctor y Abdul Aboujokh).

### 5. ✍️ Firma del Desarrollador (Vista del AppBar)
- Botón tipo credencial (`Icons.badge_outlined`) en el `AppBar`.
- Navega mediante la ruta `/signature` a `SignatureScreen`.
- Muestra la credencial digital, la firma del autor (`GoogleFonts.caveat`), código de validación `#FL-2026-HT-UNIMAR` y enlaces de contacto directo con función de copiado.

### 6. 📄 Pie de Página (Footer)
- Componente `CustomFooter` con derechos de autor, enlaces a redes y datos de la Universidad de Margarita (UNIMAR).

---

## 📂 Arquitectura y Segmentación de Carpetas

```text
mi_portafolio/
├── assets/
│   └── jar-loading.gif           # Placeholder animado para carga suave de imágenes
├── lib/
│   ├── models/                   # Modelos de datos
│   │   ├── comment_model.dart
│   │   ├── hobby_model.dart
│   │   ├── menu_options.dart
│   │   └── project_model.dart
│   ├── routes/
│   │   └── app_routes.dart       # Rutas estáticas ('/' y '/signature')
│   ├── screens/                  # Pantallas de la aplicación
│   │   ├── home_screen.dart
│   │   ├── signature_screen.dart
│   │   └── screens.dart          # Barrel file de pantallas
│   ├── themes/
│   │   └── app_themes.dart       # Configuración de temas Claro y Oscuro
│   ├── widgets/                  # Componentes reutilizables
│   │   ├── custom_card_hobby.dart
│   │   ├── custom_card_project.dart
│   │   ├── custom_footer.dart
│   │   ├── custom_input_widget.dart
│   │   └── widgets.dart          # Barrel file de widgets
│   └── main.dart                 # Punto de entrada limpio (KISS)
├── test/
│   └── widget_test.dart          # Prueba unitaria básica
├── pubspec.yaml                  # Dependencias y assets
└── README.md                     # Documentación del proyecto
```

---

## 📦 Dependencias Utilizadas

| Dependencia | Versión | Propósito |
| :--- | :--- | :--- |
| `google_nav_bar` | `^5.0.7` | Barra de navegación inferior flotante con transiciones suaves. |
| `font_awesome_flutter` | `^11.0.0` | Iconografía para redes y contactos (GitHub, Telegram). |
| `google_fonts` | `^8.2.1` | Fuentes Outfit y Caveat. |
| `cupertino_icons` | `^1.0.8` | Iconos del entorno Flutter. |

---

## 🛠️ Ejecución en Local

```bash
flutter pub get
flutter run -d edge
```

---

**Hamad El Troudi**  
*Estudiante de Ingeniería de Sistemas*  
Universidad de Margarita (UNIMAR)  
Correo: [hel_troudi.9491@unimar.edu.ve](mailto:hel_troudi.9491@unimar.edu.ve)  
Telegram: [@hamadelt](https://t.me/hamadelt)
