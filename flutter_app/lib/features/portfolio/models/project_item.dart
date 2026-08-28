class GalleryMedia {
  final String imagePath;
  final String title;
  final String description;

  const GalleryMedia({
    required this.imagePath,
    required this.title,
    this.description = '',
  });
}

class ProjectItem {
  final String id;
  final String company;
  final String role;
  final String period;
  final String logoPath;
  final bool invertLogo;
  final String summary;
  final List<String> tags;
  final List<String> highlights;
  final List<GalleryMedia> gallery;
  final String category;

  const ProjectItem({
    required this.id,
    required this.company,
    required this.role,
    required this.period,
    required this.logoPath,
    this.invertLogo = false,
    required this.summary,
    required this.tags,
    required this.highlights,
    required this.gallery,
    required this.category,
  });
}
