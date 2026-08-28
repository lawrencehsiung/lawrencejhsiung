import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_badge.dart';
import '../../../core/widgets/bauhaus_button.dart';
import '../models/project_item.dart';

class ProjectModal extends StatelessWidget {
  final GalleryMedia media;
  final String company;

  const ProjectModal({
    super.key,
    required this.media,
    required this.company,
  });

  static void show(BuildContext context, GalleryMedia media, String company) {
    showDialog(
      context: context,
      builder: (context) => ProjectModal(media: media, company: company),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 700;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isDesktop ? 32 : 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850, maxHeight: 800),
          child: Container(
            decoration: BoxDecoration(
              color: BauhausColors.surface,
              border: Border.all(color: BauhausColors.ink, width: BauhausTheme.borderWidth),
              boxShadow: const [
                BoxShadow(
                  color: BauhausColors.ink,
                  offset: Offset(8, 8),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Modal Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: const BoxDecoration(
                    color: BauhausColors.cobalt,
                    border: Border(
                      bottom: BorderSide(
                        color: BauhausColors.ink,
                        width: BauhausTheme.borderWidth,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      BauhausBadge(
                        label: company,
                        backgroundColor: BauhausColors.ochre,
                        textColor: BauhausColors.ink,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          media.title.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            letterSpacing: 0.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Close',
                      ),
                    ],
                  ),
                ),
                // Modal Image Area
                Flexible(
                  child: Container(
                    color: BauhausColors.paper,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: ClipRect(
                        child: Image.asset(
                          media.imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 250,
                            color: BauhausColors.lightGrey,
                            child: const Center(
                              child: Text('Image Preview'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Modal Caption Footer
                if (media.description.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: BauhausColors.surface,
                      border: Border(
                        top: BorderSide(
                          color: BauhausColors.ink,
                          width: BauhausTheme.borderWidth,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                media.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: BauhausColors.ink,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                media.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: BauhausColors.muted,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        BauhausButton(
                          label: 'Close',
                          onPressed: () => Navigator.of(context).pop(),
                          backgroundColor: BauhausColors.paper,
                          textColor: BauhausColors.ink,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
