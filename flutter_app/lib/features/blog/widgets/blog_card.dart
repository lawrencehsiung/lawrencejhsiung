import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_badge.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../models/blog_post.dart';

class BlogCard extends StatelessWidget {
  final BlogPost post;
  final VoidCallback onTap;
  final bool isFeatured;

  const BlogCard({
    super.key,
    required this.post,
    required this.onTap,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return BauhausCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover Image / Header Stripe
          if (post.coverImage != null && isFeatured) ...[
            Container(
              height: isDesktop ? 220 : 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BauhausColors.ink,
                    width: BauhausTheme.borderWidth,
                  ),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    post.coverImage!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: BauhausColors.cobalt,
                      child: const Center(
                        child: Icon(Icons.article, color: Colors.white, size: 48),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: BauhausBadge(
                      label: 'FEATURED POST',
                      backgroundColor: BauhausColors.vermilion,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Container(
              height: 8,
              color: _getCategoryColor(post.category),
            ),
          ],

          // Card Content
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category & Meta Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BauhausBadge(
                      label: post.category,
                      backgroundColor: _getCategoryColor(post.category).withValues(alpha: 0.2),
                      textColor: BauhausColors.ink,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 13, color: BauhausColors.muted),
                        const SizedBox(width: 4),
                        Text(
                          '${post.readTime} • ${post.date}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: BauhausColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Title
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: isFeatured ? (isDesktop ? 22 : 18) : 18,
                    fontWeight: FontWeight.w900,
                    color: BauhausColors.ink,
                    height: 1.25,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                Text(
                  post.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: BauhausColors.muted,
                    height: 1.45,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 18),

                // Tags and Read Action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 6,
                      children: post.tags.take(2).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: BauhausColors.paper,
                            border: Border.all(color: BauhausColors.ink, width: 1),
                          ),
                          child: Text(
                            '#$tag',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: BauhausColors.ink,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      children: const [
                        Text(
                          'READ POST',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
                            color: BauhausColors.cobalt,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 14, color: BauhausColors.cobalt),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Systems Engineering':
        return BauhausColors.cobalt;
      case 'Autonomous Tech':
        return BauhausColors.sage;
      case 'Film Photography':
        return BauhausColors.vermilion;
      case 'Hardware & Validation':
        return BauhausColors.ochre;
      default:
        return BauhausColors.deepOchre;
    }
  }
}
