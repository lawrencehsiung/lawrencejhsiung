import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_badge.dart';
import '../../../core/widgets/bauhaus_button.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../../../core/widgets/geometric_decorations.dart';
import '../data/blog_posts_data.dart';

class BlogDetailPage extends StatelessWidget {
  final String postId;
  final Function(String route) onNavigate;

  const BlogDetailPage({
    super.key,
    required this.postId,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    final post = BlogPostsData.posts.firstWhere(
      (p) => p.id == postId,
      orElse: () => BlogPostsData.posts.first,
    );

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 32 : 18,
              vertical: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => onNavigate('/blog'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: BauhausColors.surface,
                        border: Border.all(color: BauhausColors.ink, width: 1.5),
                        boxShadow: const [
                          BoxShadow(
                            color: BauhausColors.ink,
                            offset: Offset(2, 2),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.arrow_back, size: 14, color: BauhausColors.ink),
                          SizedBox(width: 6),
                          Text(
                            'BACK TO ALL ESSAYS',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: BauhausColors.ink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Category & Meta Strip
                Row(
                  children: [
                    BauhausBadge(
                      label: post.category,
                      backgroundColor: BauhausColors.vermilion,
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${post.date} • ${post.readTime}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: BauhausColors.muted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Main Article Title
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: isDesktop ? 34 : 26,
                    fontWeight: FontWeight.w900,
                    color: BauhausColors.ink,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  post.subtitle,
                  style: TextStyle(
                    fontSize: isDesktop ? 18 : 15,
                    color: BauhausColors.muted,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),

                // Bauhaus Divider Line
                Container(
                  height: 3,
                  width: double.infinity,
                  color: BauhausColors.ink,
                ),
                const SizedBox(height: 28),

                // Cover Image (if available)
                if (post.coverImage != null) ...[
                  Container(
                    height: isDesktop ? 340 : 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: BauhausColors.paper,
                      border: Border.all(color: BauhausColors.ink, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: BauhausColors.ink,
                          offset: Offset(4, 4),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      post.coverImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: BauhausColors.cobalt,
                        child: const Icon(Icons.image, color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],

                // Article Sections
                ...post.sections.map((section) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (section.heading != null) ...[
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                color: BauhausColors.cobalt,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  section.heading!.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: isDesktop ? 20 : 17,
                                    fontWeight: FontWeight.w900,
                                    color: BauhausColors.ink,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                        ],
                        Text(
                          section.content,
                          style: TextStyle(
                            fontSize: isDesktop ? 16 : 15,
                            height: 1.65,
                            color: BauhausColors.ink,
                          ),
                        ),
                        if (section.callout != null) ...[
                          const SizedBox(height: 18),
                          BauhausCard(
                            backgroundColor: BauhausColors.ochre.withValues(alpha: 0.3),
                            borderColor: BauhausColors.ink,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BauhausGlyph(
                                  shape: BauhausShape.triangle,
                                  size: 20,
                                  color: BauhausColors.vermilion,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    section.callout!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: BauhausColors.ink,
                                      height: 1.45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 16),

                // Tags List
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: post.tags.map((tag) {
                    return BauhausBadge(
                      label: '#$tag',
                      backgroundColor: BauhausColors.paper,
                      textColor: BauhausColors.ink,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),

                // Author Card
                BauhausCard(
                  backgroundColor: BauhausColors.surface,
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: BauhausColors.ink, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/me.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'WRITTEN BY LAWRENCE HSIUNG',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                letterSpacing: 0.5,
                                color: BauhausColors.ink,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Systems & Electrical Engineer @ Lucid Motors. Focused on rapid hardware prototyping, autonomous vehicle payloads, and analog photography.',
                              style: TextStyle(fontSize: 13, color: BauhausColors.muted, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),

                // Bottom Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BauhausButton.outline(
                      label: 'All Essays',
                      icon: Icons.arrow_back,
                      onPressed: () => onNavigate('/blog'),
                    ),
                    BauhausButton.primary(
                      label: 'Explore Portfolio',
                      icon: Icons.work_outline,
                      onPressed: () => onNavigate('/portfolio'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
