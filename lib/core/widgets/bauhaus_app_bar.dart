import 'package:flutter/material.dart';
import '../theme/bauhaus_theme.dart';
import '../utils/url_launcher_helper.dart';
import 'brand_icons.dart';

class BauhausAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;
  final Function(String route) onNavigate;

  const BauhausAppBar({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 820;

    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: BauhausColors.surface,
        border: Border(
          bottom: BorderSide(
            color: BauhausColors.ink,
            width: BauhausTheme.borderWidth,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: BauhausColors.ink,
            offset: Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      child: Row(
        children: [
          // Logo / Brand Badge
          InkWell(
            onTap: () => onNavigate('/'),
            hoverColor: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: BauhausColors.vermilion,
                    border: Border.all(color: BauhausColors.ink, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: BauhausColors.ink,
                        offset: Offset(2, 2),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'LH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'LAWRENCE HSIUNG',
                      style: TextStyle(
                        color: BauhausColors.ink,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      'SYSTEMS & ELECTRICAL ENGINEER',
                      style: TextStyle(
                        color: BauhausColors.muted,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),

          // Navigation items (Desktop)
          if (isDesktop) ...[
            _buildNavItem('HOME', '/', BauhausColors.vermilion),
            const SizedBox(width: 8),
            _buildNavItem('PORTFOLIO', '/portfolio', BauhausColors.cobalt),
            const SizedBox(width: 8),
            _buildNavItem('BLOG', '/blog', BauhausColors.ochre),
            const SizedBox(width: 8),
            _buildNavItem('RÉSUMÉ', '/resume', BauhausColors.sage),
            const SizedBox(width: 24),
            Container(
              height: 24,
              width: 2,
              color: BauhausColors.ink,
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              type: BrandIconType.linkedIn,
              tooltip: 'LinkedIn',
              onTap: () => UrlHelper.launch(UrlHelper.linkedIn),
            ),
            const SizedBox(width: 10),
            _buildSocialIcon(
              type: BrandIconType.instagram,
              tooltip: 'Film Photography (@film.foto.lan)',
              onTap: () => UrlHelper.launch(UrlHelper.instagram),
            ),
            const SizedBox(width: 10),
            _buildSocialIcon(
              type: BrandIconType.github,
              tooltip: 'GitHub',
              onTap: () => UrlHelper.launch(UrlHelper.github),
            ),
            const SizedBox(width: 10),
            _buildSocialIcon(
              type: BrandIconType.email,
              tooltip: 'Contact Email',
              onTap: () => UrlHelper.launch(UrlHelper.email),
            ),
          ] else ...[
            // Mobile Menu Button
            PopupMenuButton<String>(
              icon: Container(
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
                child: const Icon(Icons.menu, color: BauhausColors.ink, size: 22),
              ),
              color: BauhausColors.surface,
              surfaceTintColor: Colors.transparent,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: BauhausColors.ink, width: 2),
                borderRadius: BorderRadius.zero,
              ),
              onSelected: (route) {
                if (route.startsWith('http') || route.startsWith('mailto:')) {
                  UrlHelper.launch(route);
                } else {
                  onNavigate(route);
                }
              },
              itemBuilder: (context) => [
                _buildPopupMenuItem('HOME', '/', Icons.home_outlined),
                _buildPopupMenuItem('PORTFOLIO', '/portfolio', Icons.work_outline),
                _buildPopupMenuItem('BLOG', '/blog', Icons.article_outlined),
                _buildPopupMenuItem('RÉSUMÉ', '/resume', Icons.description_outlined),
                const PopupMenuDivider(),
                _buildPopupMenuItem('LinkedIn', UrlHelper.linkedIn, Icons.link),
                _buildPopupMenuItem('Film Photography', UrlHelper.instagram, Icons.camera_alt_outlined),
                _buildPopupMenuItem('GitHub', UrlHelper.github, Icons.code),
                _buildPopupMenuItem('Email Contact', UrlHelper.email, Icons.mail_outline),
              ],
            ),
          ],
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String label, String value, IconData icon) {
    final isSelected = currentRoute == value;
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 16, color: isSelected ? BauhausColors.vermilion : BauhausColors.ink),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
              fontSize: 13,
              color: isSelected ? BauhausColors.vermilion : BauhausColors.ink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String route, Color accent) {
    final isSelected = currentRoute == route || (route != '/' && currentRoute.startsWith(route));
    return _NavButton(
      label: label,
      isSelected: isSelected,
      accentColor: accent,
      onTap: () => onNavigate(route),
    );
  }

  Widget _buildSocialIcon({
    required BrandIconType type,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: BauhausColors.paper,
              border: Border.all(color: BauhausColors.ink, width: 1.5),
              boxShadow: const [
                BoxShadow(
                  color: BauhausColors.ink,
                  offset: Offset(2, 2),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: BrandIcon(type: type, size: 15, color: BauhausColors.ink),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Color accentColor;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.isSelected,
    required this.accentColor,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.accentColor
                : (_isHovered ? BauhausColors.lightGrey : Colors.transparent),
            border: Border.all(
              color: widget.isSelected ? BauhausColors.ink : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: widget.isSelected
                ? const [
                    BoxShadow(
                      color: BauhausColors.ink,
                      offset: Offset(2, 2),
                      blurRadius: 0,
                    ),
                  ]
                : null,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.isSelected
                  ? (widget.accentColor == BauhausColors.ochre ? BauhausColors.ink : Colors.white)
                  : BauhausColors.ink,
              fontWeight: FontWeight.w900,
              fontSize: 13,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
