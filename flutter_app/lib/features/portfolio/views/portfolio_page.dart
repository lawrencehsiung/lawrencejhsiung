import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_button.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../../../core/widgets/geometric_decorations.dart';
import '../data/portfolio_data.dart';
import '../widgets/project_card.dart';

class PortfolioPage extends StatefulWidget {
  final Function(String route) onNavigate;

  const PortfolioPage({super.key, required this.onNavigate});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String _selectedCategory = 'ALL';

  final List<String> _categories = [
    'ALL',
    'EV & Prototyping',
    'Autonomous Robotics',
    'Audio & Communications',
    'Wearables & Consumer Tech',
  ];

  final List<Color> _accentColors = [
    BauhausColors.cobalt,
    BauhausColors.sage,
    BauhausColors.vermilion,
    BauhausColors.deepOchre,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    final filteredProjects = _selectedCategory == 'ALL'
        ? PortfolioData.projects
        : PortfolioData.projects
            .where((p) => p.category == _selectedCategory)
            .toList();

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
                // Section Heading
                const BauhausSectionHeading(
                  title: 'Engineering Portfolio',
                  subtitle:
                      'Showcasing concept vehicle architectures, autonomous agriculture robotics, acoustic testing, and wearable hardware.',
                  shape: BauhausShape.square,
                  accentColor: BauhausColors.cobalt,
                ),
                const SizedBox(height: 28),

                // Category Filter Bar
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedCategory = category),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? BauhausColors.cobalt : BauhausColors.surface,
                            border: Border.all(color: BauhausColors.ink, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: BauhausColors.ink,
                                offset: Offset(isSelected ? 3 : 2, isSelected ? 3 : 2),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Text(
                            category.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.6,
                              color: isSelected ? Colors.white : BauhausColors.ink,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 36),

                // Project Cards List
                if (filteredProjects.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BauhausTheme.cardDecoration,
                    child: const Center(
                      child: Text('No projects found in this category.'),
                    ),
                  )
                else
                  ...filteredProjects.asMap().entries.map((entry) {
                    final index = entry.key;
                    final project = entry.value;
                    final color = _accentColors[index % _accentColors.length];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 36.0),
                      child: ProjectCard(
                        project: project,
                        headerColor: color,
                      ),
                    );
                  }),

                const SizedBox(height: 20),

                // Bottom Callout Card
                BauhausCard(
                  backgroundColor: BauhausColors.ochre,
                  padding: const EdgeInsets.all(28),
                  child: isDesktop
                      ? Row(
                          children: [
                            const BauhausGlyph(
                              shape: BauhausShape.triangle,
                              size: 36,
                              color: BauhausColors.vermilion,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'INTERESTED IN DETAILED TECHNICAL SPECS OR COLLABORATION?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      color: BauhausColors.ink,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Check out my full résumé or reach out via email or LinkedIn.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: BauhausColors.ink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            BauhausButton.primary(
                              label: 'View Résumé',
                              onPressed: () => widget.onNavigate('/resume'),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'INTERESTED IN COLLABORATION?',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: BauhausColors.ink,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Check out my full résumé or reach out via email.',
                              style: TextStyle(fontSize: 14, color: BauhausColors.ink),
                            ),
                            const SizedBox(height: 16),
                            BauhausButton.primary(
                              label: 'View Résumé',
                              onPressed: () => widget.onNavigate('/resume'),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
