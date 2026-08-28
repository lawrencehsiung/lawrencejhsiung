import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../../../core/widgets/geometric_decorations.dart';
import '../data/blog_posts_data.dart';
import '../widgets/blog_card.dart';

class BlogListPage extends StatefulWidget {
  final Function(String route) onNavigate;

  const BlogListPage({super.key, required this.onNavigate});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  String _selectedCategory = 'ALL';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'ALL',
    'Systems Engineering',
    'Autonomous Tech',
    'Film Photography',
    'Hardware & Validation',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    final filteredPosts = BlogPostsData.posts.where((post) {
      final matchesCategory =
          _selectedCategory == 'ALL' || post.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          post.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          post.subtitle.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          post.tags.any((t) => t.toLowerCase().contains(_searchQuery.toLowerCase()));
      return matchesCategory && matchesSearch;
    }).toList();

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
                // Heading
                const BauhausSectionHeading(
                  title: 'Engineering & Analog Essays',
                  subtitle:
                      'Technical articles on electrical vehicle architecture, autonomous robotics testing, and film photography.',
                  shape: BauhausShape.circle,
                  accentColor: BauhausColors.vermilion,
                ),
                const SizedBox(height: 28),

                // Search & Filter Controls
                isDesktop
                    ? Row(
                        children: [
                          Expanded(child: _buildCategoryTabs()),
                          const SizedBox(width: 20),
                          SizedBox(width: 260, child: _buildSearchBar()),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSearchBar(),
                          const SizedBox(height: 16),
                          _buildCategoryTabs(),
                        ],
                      ),
                const SizedBox(height: 36),

                // Posts List / Grid
                if (filteredPosts.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(40),
                    decoration: BauhausTheme.cardDecoration,
                    child: Center(
                      child: Column(
                        children: [
                          const BauhausGlyph(
                            shape: BauhausShape.triangle,
                            size: 32,
                            color: BauhausColors.ochre,
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'NO ESSAYS FOUND',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: BauhausColors.ink,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Try adjusting your search query or selecting a different category.',
                            style: TextStyle(
                              fontSize: 14,
                              color: BauhausColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else ...[
                  // Featured First Post
                  if (_searchQuery.isEmpty && _selectedCategory == 'ALL') ...[
                    BlogCard(
                      post: filteredPosts.first,
                      isFeatured: true,
                      onTap: () => widget.onNavigate('/blog/${filteredPosts.first.id}'),
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Remaining Grid
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: (_searchQuery.isEmpty && _selectedCategory == 'ALL'
                            ? filteredPosts.skip(1).toList()
                            : filteredPosts)
                        .map((post) {
                      final itemWidth = isDesktop
                          ? (1100 - 64 - 24) / 2
                          : double.infinity;

                      return SizedBox(
                        width: itemWidth,
                        child: BlogCard(
                          post: post,
                          onTap: () => widget.onNavigate('/blog/${post.id}'),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                const SizedBox(height: 48),

                // Suggestion Box
                BauhausCard(
                  backgroundColor: BauhausColors.paper,
                  padding: const EdgeInsets.all(28),
                  child: Row(
                    children: [
                      const BauhausShapeCluster(size: 24),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'HAVE A TOPIC SUGGESTION OR QUESTION?',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: BauhausColors.ink,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'I love discussing EV systems, precision testing, and analog photography. Reach out!',
                              style: TextStyle(fontSize: 13, color: BauhausColors.muted),
                            ),
                          ],
                        ),
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

  Widget _buildCategoryTabs() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _categories.map((category) {
        final isSelected = _selectedCategory == category;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => setState(() => _selectedCategory = category),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: isSelected ? BauhausColors.vermilion : BauhausColors.surface,
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
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: isSelected ? Colors.white : BauhausColors.ink,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: BauhausColors.surface,
        border: Border.all(color: BauhausColors.ink, width: 2),
        boxShadow: const [
          BoxShadow(
            color: BauhausColors.ink,
            offset: Offset(2, 2),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (val) => setState(() => _searchQuery = val),
        style: const TextStyle(fontSize: 13, color: BauhausColors.ink),
        decoration: InputDecoration(
          hintText: 'Search essays or tags...',
          hintStyle: const TextStyle(fontSize: 13, color: BauhausColors.muted),
          prefixIcon: const Icon(Icons.search, size: 18, color: BauhausColors.ink),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 16, color: BauhausColors.ink),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}
