class ProjectModel {
  final String title;
  final String tag;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String linkText;

  const ProjectModel({
    required this.title,
    required this.tag,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.linkText = 'Ver Detalles',
  });
}
