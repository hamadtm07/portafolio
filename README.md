# 📱 Portafolio Personal - Flutter

**Proyecto Evaluativo de Portafolio Personal** para la asignatura **Programación III** (Período Septiembre 2026).  
Desarrollado por **Hamad El Troudi**, estudiante de Ingeniería de Sistemas en la Universidad Metropolitana (UNIMET).

---

## 🎯 Objetivo del Proyecto

Crear una aplicación móvil atractiva, intuitiva y funcional a modo de portafolio personal utilizando **Flutter & Dart**. El proyecto demuestra los conocimientos fundamentales adquiridos en clases sobre construcción de interfaces de usuario, segmentación de archivos, uso de temas, manejo de dependencias externas, navegación por rutas nombradas y validación de formularios bajo el principio **KISS (Keep It Simple, Stupid)**.

---

## 🚀 Características y Secciones de la Aplicación

La aplicación se encuentra organizada en vistas fluidas integradas con una barra de navegación inferior (`GoogleNavBar`), más una pantalla independiente accesible desde el `AppBar`:

### 1. 👤 Sobre mí / ¿Quién soy?
- **Avatar de perfil** con borde distintivo y tipografía estilizada.
- **Biografía personal**: Presentación de metas académicas, vocación tecnológica y enfoque como futuro ingeniero de sistemas.
- **Ficha académica**: Universidad Metropolitana (UNIMET), carrera, materia y habilidades lingüísticas.
- **Botones de acción rápida**: Acceso directo a la firma de desarrollador y contacto.

### 2. 💻 ¿Qué hago? (Habilidades & Proyectos)
- **Habilidades Técnicas**: Etiquetas visuales interactivas que destacan conocimientos en Flutter, Dart, Python, C#, Bases de Datos (SQL), Git/GitHub y diseño UI.
- **Tarjetas de Proyectos (`CustomCardProject`)**:
  - Implementación de `FadeInImage` con placeholder local animado (`assets/jar-loading.gif`) para carga suave de imágenes de red.
  - Títulos, etiquetas de categoría y descripción sintetizada.
  - Botón interactivo *"Ver Detalles"* que despliega un diálogo informativo (`AlertDialog`) con las tecnologías empleadas.

### 3. 🎮 Hobbies e Intereses
- Presentación de pasatiempos que complementan la rutina de estudio:
  - **Desarrollo & Modding** (tecnología y lógica de juego).
  - **Música & Producción** (géneros que potencian la concentración).
  - **Ajedrez & Videojuegos Tácticos** (pensamiento estratégico y resolución de problemas).
  - **Entrenamiento Físico** (calistenia y gimnasio).
  - **Hardware & Optimización de PCs** (rendimiento y ensamblaje).
- Diseñado con tarjetas modulares (`CustomCardHobby`) con iconos temáticos y paleta de colores diferenciada.

### 4. 💬 Sección de Comentarios
- **Formulario Interactivo** para que los visitantes puedan dejar su opinión o mensaje de contacto.
- Campos de entrada personalizados con `CustomInput`:
  - Nombre completo.
  - Correo electrónico (con validación de formato mediante expresiones regulares).
  - Comentario / mensaje (multilínea).
- Validación de formulario con `GlobalKey<FormState>`.
- Publicación reactiva: agrega el comentario en tiempo real a la lista visible y notifica al usuario mediante un `SnackBar`.

### 5. ✍️ Firma del Desarrollador (Vista del AppBar)
- **Requisito especial cumplido**: Botón tipo credencial (`Icons.badge_outlined`) ubicado en las acciones del `AppBar`.
- Al presionarlo, navega mediante rutas nombradas (`/signature`) a la pantalla `SignatureScreen`.
- Muestra:
  - Tarjeta de credencial digital del estudiante.
  - Firma manuscrita estilizada (`GoogleFonts.caveat`).
  - Código único de verificación académica.
  - Canales de contacto directo (Correo institucional, perfil de GitHub y usuario de Telegram) con función de copiado rápido al portapapeles.

### 6. 📄 Pie de Página (Footer)
- Componente reutilizable (`CustomFooter`) presente al final de las secciones.
- Incluye derechos de autor (© 2026 Hamad El Troudi), enlaces sociales mediante iconos de `FontAwesomeIcons` y mensaje informativo de cierre.

---

## 📂 Arquitectura y Segmentación de Carpetas

Siguiendo las buenas prácticas y las pautas de clase, el proyecto está estructurado de manera modular y escalable:

```text
mi_portafolio/
├── assets/
│   └── jar-loading.gif           # Placeholder animado para carga de imágenes
├── lib/
│   ├── models/                   # Clases de datos y modelos del dominio
│   │   ├── comment_model.dart    # Modelo para comentarios
│   │   ├── hobby_model.dart      # Modelo para tarjetas de pasatiempos
│   │   ├── menu_options.dart     # Modelo para opciones de menú/navegación
│   │   └── project_model.dart    # Modelo para proyectos destacados
│   ├── routes/
│   │   └── app_routes.dart       # Definición de rutas estáticas e initialRoute
│   ├── screens/                  # Vistas o pantallas completas
│   │   ├── home_screen.dart      # Pantalla principal con IndexedStack y GNav
│   │   ├── signature_screen.dart # Pantalla de firma del desarrollador (AppBar)
│   │   └── screens.dart          # Barrel file (exportador de pantallas)
│   ├── themes/
│   │   └── app_themes.dart       # Configuración de temas Claro y Oscuro (Material 3)
│   ├── widgets/                  # Componentes y widgets reutilizables
│   │   ├── custom_card_hobby.dart
│   │   ├── custom_card_project.dart
│   │   ├── custom_footer.dart
│   │   ├── custom_input_widget.dart
│   │   └── widgets.dart          # Barrel file (exportador de widgets)
│   └── main.dart                 # Punto de entrada limpio (KISS)
├── test/
│   └── widget_test.dart          # Prueba unitaria básica de renderizado
├── pubspec.yaml                  # Definición de dependencias y assets
└── README.md                     # Documentación completa del proyecto
```

> **Nota sobre `main.dart`**: Se mantuvo lo más limpio posible (apenas 22 líneas de código), delegando la configuración de temas a `AppThemes` y la navegación a `AppRoutes`.

---

## 📦 Dependencias Utilizadas

| Dependencia | Versión | Propósito en el Proyecto |
| :--- | :--- | :--- |
| `google_nav_bar` | `^5.0.7` | Barra de navegación inferior flotante con transiciones suaves y estilo moderno. |
| `font_awesome_flutter` | `^11.0.0` | Iconos de marcas y redes sociales (GitHub, LinkedIn, Telegram). |
| `google_fonts` | `^8.2.1` | Tipografías limpias y profesionales (`Outfit` para texto general y `Caveat` para la firma). |
| `cupertino_icons` | `^1.0.8` | Iconografía adicional del ecosistema Flutter. |

---

## 🎨 Temas: Claro y Oscuro

La aplicación cuenta con soporte nativo para **Modo Claro** y **Modo Oscuro** definido en `AppThemes`:
- **Tema Claro**: Fondo limpio (`#F8FAFC`), tarjetas blancas con sutil elevación y acento en verde azulado (`#0F766E`).
- **Tema Oscuro**: Fondo moderno Slate (`#0F172A`), tarjetas oscuras (`#1E293B`) y botones con alto contraste.

---

## 🛠️ Instrucciones de Instalación y Ejecución

Para clonar y ejecutar este proyecto en tu entorno local:

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/hamadeltroudi/mi_portafolio.git
   cd mi_portafolio
   ```

2. **Obtener las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Verificar que el código esté limpio**:
   ```bash
   flutter analyze
   ```

4. **Ejecutar las pruebas**:
   ```bash
   flutter test
   ```

5. **Lanzar la aplicación**:
   ```bash
   flutter run
   ```
   *(Puedes seleccionar tu dispositivo Android, emulador o navegador Chrome/Edge).*

---

## 📋 Nomenclaturas y Buenas Prácticas

- **Archivos y carpetas**: `lower_snake_case` (ej. `home_screen.dart`, `app_routes.dart`).
- **Clases y Widgets**: `UpperCamelCase` (ej. `HomeScreen`, `CustomCardProject`).
- **Variables y Métodos**: `lowerCamelCase` (ej. `_currentIndex`, `_enviarComentario`).
- **Barrel Files**: Agrupación y exportación centralizada mediante `screens.dart` y `widgets.dart` para simplificar importaciones.
- **Principio KISS**: Código comprensible, autoexplicativo y con comentarios descriptivos en español.

---

**Hamad El Troudi**  
*Estudiante de Ingeniería de Sistemas*  
Universidad Metropolitana — Caracas, Venezuela  
Correo: [hamad.eltroudi@correo.unimet.edu.ve](mailto:hamad.eltroudi@correo.unimet.edu.ve)
