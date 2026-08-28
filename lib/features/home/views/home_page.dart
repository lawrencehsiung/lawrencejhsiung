import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/bauhaus_button.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../../../core/widgets/geometric_decorations.dart';
import '../../blog/data/blog_posts_data.dart';
import '../../blog/widgets/blog_card.dart';
import '../../portfolio/data/portfolio_data.dart';
import '../../portfolio/widgets/project_card.dart';

class HomePage extends StatelessWidget {
  final Function(String route) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 860;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 32 : 16,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                _buildHeroSection(context, isDesktop),
                const SizedBox(height: 56),

                // Pillars / Disciplines Section
                _buildPillarsSection(context, isDesktop),
                const SizedBox(height: 56),

                // Featured Engineering Projects
                _buildFeaturedProjectsSection(context, isDesktop),
                const SizedBox(height: 56),

                // Latest Blog Thoughts
                _buildLatestBlogSection(context, isDesktop),
                const SizedBox(height: 56),

                // Connect & Contact Banner
                _buildContactBanner(context, isDesktop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDesktop) {
    final textTheme = Theme.of(context).textTheme;

    final profileImageWidget = Container(
      width: isDesktop ? 280 : 220,
      height: isDesktop ? 280 : 220,
      decoration: BoxDecoration(
        color: BauhausColors.ochre,
        border: Border.all(color: BauhausColors.ink, width: BauhausTheme.borderWidth),
        boxShadow: const [
          BoxShadow(
            color: BauhausColors.ink,
            offset: Offset(8, 8),
            blurRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/me.jpeg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.person, size: 80, color: BauhausColors.ink),
              ),
            ),
          ),
          Positioned(
            top: -1,
            left: -1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: BauhausColors.vermilion,
                border: Border(
                  right: BorderSide(color: BauhausColors.ink, width: 2),
                  bottom: BorderSide(color: BauhausColors.ink, width: 2),
                ),
              ),
              child: const Text(
                'SYSTEMS ENG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final bioContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            BauhausShapeCluster(size: 18),
            SizedBox(width: 12),
            Text(
              'PROTOTYPES & SYSTEMS ENGINEER',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                letterSpacing: 1.5,
                color: BauhausColors.cobalt,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Lawrence Hsiung',
          style: textTheme.displayLarge?.copyWith(
            fontSize: isDesktop ? 48 : 34,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: BauhausColors.paper,
            border: Border.all(color: BauhausColors.ink, width: 1.5),
          ),
          child: const Text(
            'Prototypes and Concepts Systems Engineer @ Lucid Motors',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: BauhausColors.ink,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'I specialize in rapid hardware integration, low-voltage vehicle electrical architectures, and autonomous robotic systems. '
          'From designing wire harnesses for upcoming Lucid concept vehicles to field-testing autonomous ag-tech robots and evaluating analog film optics—I love building things that solve complex physical problems.',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: isDesktop ? 16 : 14,
            color: BauhausColors.ink,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            BauhausButton.primary(
              label: 'Explore Portfolio',
              icon: Icons.work_outline,
              onPressed: () => onNavigate('/portfolio'),
            ),
            BauhausButton.secondary(
              label: 'Read Essays',
              icon: Icons.article_outlined,
              onPressed: () => onNavigate('/blog'),
            ),
            BauhausButton.outline(
              label: 'Résumé',
              icon: Icons.description_outlined,
              onPressed: () => onNavigate('/resume'),
            ),
          ],
        ),
      ],
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileImageWidget,
          const SizedBox(width: 48),
          Expanded(child: bioContent),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileImageWidget,
          const SizedBox(height: 28),
          bioContent,
        ],
      );
    }
  }

  Widget _buildPillarsSection(BuildContext context, bool isDesktop) {
    final pillars = [
      _PillarItem(
        icon: Icons.electric_car,
        title: 'EV ARCHITECTURE',
        subtitle: 'Showcar Electrical Systems',
        desc:
            'Low-voltage power distribution, custom wiring harnesses, CAN/LIN vehicle network integration, and rapid prototype bring-up.',
        accentColor: BauhausColors.vermilion,
      ),
      _PillarItem(
        icon: Icons.smart_toy,
        title: 'AUTONOMOUS ROBOTICS',
        subtitle: 'Harsh Field Validation',
        desc:
            'Ruggedized compute enclosures (IPS Box), sensor integration, precision blade actuators, and FMEA for agricultural robots.',
        accentColor: BauhausColors.sage,
      ),
      _PillarItem(
        icon: Icons.graphic_eq,
        title: 'HARDWARE & AUDIO TEST',
        subtitle: 'Anechoic & Bench Testing',
        desc:
            'Acoustic validation, Python test automation, failure mode analysis (FA), and hardware certification for consumer devices.',
        accentColor: BauhausColors.cobalt,
      ),
      _PillarItem(
        icon: Icons.camera_alt_outlined,
        title: 'FILM PHOTOGRAPHY',
        subtitle: 'Analog Precision & Optics',
        desc:
            '35mm and medium format analog film photography, exploring intentional composition, optical mechanics, and chemical processes.',
        accentColor: BauhausColors.ochre,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BauhausSectionHeading(
          title: 'Core Disciplines',
          subtitle: 'Multidisciplinary engineering with a focus on hardware and tangible physical systems.',
          shape: BauhausShape.triangle,
          accentColor: BauhausColors.vermilion,
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop ? (constraints.maxWidth - 36) / 2 : double.infinity;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: pillars.map((p) {
                return SizedBox(
                  width: cardWidth,
                  child: BauhausCard(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: p.accentColor,
                                border: Border.all(color: BauhausColors.ink, width: 2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: BauhausColors.ink,
                                    offset: Offset(2, 2),
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                              child: Icon(p.icon, color: Colors.white, size: 20),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                      letterSpacing: 0.8,
                                      color: BauhausColors.ink,
                                    ),
                                  ),
                                  Text(
                                    p.subtitle,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: BauhausColors.muted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          p.desc,
                          style: const TextStyle(
                            fontSize: 14,
                            color: BauhausColors.ink,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeaturedProjectsSection(BuildContext context, bool isDesktop) {
    final featured = PortfolioData.projects.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: BauhausSectionHeading(
                title: 'Featured Projects',
                subtitle: 'Key engineering highlights from Lucid Motors and Farmwise Labs.',
                shape: BauhausShape.square,
                accentColor: BauhausColors.cobalt,
              ),
            ),
            if (isDesktop)
              BauhausButton.outline(
                label: 'View All (4)',
                icon: Icons.arrow_forward,
                onPressed: () => onNavigate('/portfolio'),
              ),
          ],
        ),
        const SizedBox(height: 28),
        ...featured.asMap().entries.map((entry) {
          final colors = [BauhausColors.cobalt, BauhausColors.sage];
          return Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: ProjectCard(
              project: entry.value,
              headerColor: colors[entry.key % colors.length],
            ),
          );
        }),
        if (!isDesktop) ...[
          const SizedBox(height: 12),
          Center(
            child: BauhausButton.outline(
              label: 'View All Projects',
              icon: Icons.arrow_forward,
              onPressed: () => onNavigate('/portfolio'),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLatestBlogSection(BuildContext context, bool isDesktop) {
    final recentPosts = BlogPostsData.posts.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: BauhausSectionHeading(
                title: 'Latest Essays & Insights',
                subtitle: 'Deep dives into engineering challenges, field testing, and film photography.',
                shape: BauhausShape.circle,
                accentColor: BauhausColors.ochre,
              ),
            ),
            if (isDesktop)
              BauhausButton.outline(
                label: 'View All Essays',
                icon: Icons.arrow_forward,
                onPressed: () => onNavigate('/blog'),
              ),
          ],
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop ? (constraints.maxWidth - 24) / 2 : double.infinity;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: recentPosts.map((post) {
                return SizedBox(
                  width: cardWidth,
                  child: BlogCard(
                    post: post,
                    onTap: () => onNavigate('/blog/${post.id}'),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContactBanner(BuildContext context, bool isDesktop) {
    return BauhausCard(
      backgroundColor: BauhausColors.ink,
      borderColor: BauhausColors.ink,
      padding: EdgeInsets.all(isDesktop ? 36 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              BauhausGlyph(
                shape: BauhausShape.circle,
                size: 24,
                color: BauhausColors.vermilion,
              ),
              SizedBox(width: 12),
              Text(
                'LET\'S CONNECT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Always excited to connect with fellow engineers, designers, and analog photographers. '
            'Whether you want to discuss EV vehicle platforms, autonomous hardware test benches, or film recipes—let\'s chat.',
            style: TextStyle(
              color: BauhausColors.paper,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              BauhausButton(
                label: 'Send Email',
                icon: Icons.email_outlined,
                backgroundColor: BauhausColors.vermilion,
                textColor: Colors.white,
                onPressed: () => UrlHelper.launch(UrlHelper.email),
              ),
              BauhausButton(
                label: 'LinkedIn Profile',
                icon: Icons.link,
                backgroundColor: BauhausColors.cobalt,
                textColor: Colors.white,
                onPressed: () => UrlHelper.launch(UrlHelper.linkedIn),
              ),
              BauhausButton(
                label: 'Instagram Film Diary',
                icon: Icons.camera_alt_outlined,
                backgroundColor: BauhausColors.ochre,
                textColor: BauhausColors.ink,
                onPressed: () => UrlHelper.launch(UrlHelper.instagram),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PillarItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String desc;
  final Color accentColor;

  const _PillarItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.accentColor,
  });
}
