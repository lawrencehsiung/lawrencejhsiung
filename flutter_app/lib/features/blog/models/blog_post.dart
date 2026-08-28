class BlogSection {
  final String? heading;
  final String content;
  final String? callout;
  final String? codeSnippet;
  final String? imagePath;
  final String? imageCaption;

  const BlogSection({
    this.heading,
    required this.content,
    this.callout,
    this.codeSnippet,
    this.imagePath,
    this.imageCaption,
  });
}

class BlogPost {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String date;
  final String readTime;
  final String? coverImage;
  final List<String> tags;
  final List<BlogSection> sections;

  const BlogPost({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.date,
    required this.readTime,
    this.coverImage,
    required this.tags,
    required this.sections,
  });
}
