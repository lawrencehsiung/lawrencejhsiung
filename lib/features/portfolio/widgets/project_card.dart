import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_badge.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../models/project_item.dart';
import 'project_modal.dart';

class ProjectCard extends StatelessWidget {
  final ProjectItem project;
  final Color headerColor;

  const ProjectCard({
    super.key,
    required this.project,
    this.headerColor = BauhausColors.cobalt,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return BauhausCard(
      padding: EdgeInsets.zero,
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: BoxDecoration(
              color: headerColor,
              border: const Border(
                bottom: BorderSide(
                  color: BauhausColors.ink,
                  width: BauhausTheme.borderWidth,
                ),
              ),
            ),
            child: Row(
              children: [
                // Company Logo Box
                Container(
                  width: 46,
                  height: 46,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: BauhausColors.paper,
                    border: Border.all(color: BauhausColors.ink, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: BauhausColors.ink,
                        offset: Offset(2, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    project.logoPath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.business,
                      color: BauhausColors.ink,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              project.company.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                letterSpacing: 0.8,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          BauhausBadge(
                            label: project.category,
                            backgroundColor: BauhausColors.ochre,
                            textColor: BauhausColors.ink,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${project.role} • ${project.period}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Body Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary
                Text(
                  project.summary,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 20),

                // Key Highlights
                const Text(
                  'KEY CONTRIBUTIONS & IMPACT',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    color: BauhausColors.ink,
                  ),
                ),
                const SizedBox(height: 10),
                ...project.highlights.map(
                  (bullet) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6, right: 10),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: BauhausColors.vermilion,
                            border: Border.all(color: BauhausColors.ink, width: 1.5),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            bullet,
                            style: const TextStyle(
                              fontSize: 14,
                              color: BauhausColors.ink,
                              height: 1.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Visual Gallery / Project Artifacts
                if (project.gallery.isNotEmpty) ...[
                  const Text(
                    'PROJECT ARTIFACTS & GALLERIES',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                      color: BauhausColors.ink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: project.gallery.map((media) {
                      return _GalleryThumbnail(
                        media: media,
                        company: project.company,
                        width: isDesktop ? 220 : 160,
                        height: isDesktop ? 140 : 110,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // Tags Row
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags.map((tag) {
                    return BauhausBadge(
                      label: tag,
                      backgroundColor: BauhausColors.paper,
                      textColor: BauhausColors.ink,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryThumbnail extends StatefulWidget {
  final GalleryMedia media;
  final String company;
  final double width;
  final double height;

  const _GalleryThumbnail({
    required this.media,
    required this.company,
    required this.width,
    required this.height,
  });

  @override
  State<_GalleryThumbnail> createState() => _GalleryThumbnailState();
}

class _GalleryThumbnailState extends State<_GalleryThumbnail> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => ProjectModal.show(context, widget.media, widget.company),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width,
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          decoration: BoxDecoration(
            color: BauhausColors.paper,
            border: Border.all(color: BauhausColors.ink, width: 2),
            boxShadow: [
              BoxShadow(
                color: BauhausColors.ink,
                offset: Offset(_isHovered ? 4 : 2, _isHovered ? 4 : 2),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: widget.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.media.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: BauhausColors.lightGrey,
                        child: const Icon(Icons.image, color: BauhausColors.muted),
                      ),
                    ),
                    if (_isHovered)
                      Container(
                        color: BauhausColors.cobalt.withValues(alpha: 0.4),
                        child: const Center(
                          child: Icon(Icons.zoom_in, color: Colors.white, size: 28),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: const BoxDecoration(
                  color: BauhausColors.surface,
                  border: Border(
                    top: BorderSide(color: BauhausColors.ink, width: 1.5),
                  ),
                ),
                child: Text(
                  widget.media.title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: BauhausColors.ink,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
