import 'package:flutter/material.dart';
import '../theme/bauhaus_theme.dart';
import '../utils/url_launcher_helper.dart';
import 'brand_icons.dart';
import 'geometric_decorations.dart';

class BauhausFooter extends StatelessWidget {
  final Function(String route) onNavigate;

  const BauhausFooter({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Container(
      decoration: const BoxDecoration(
        color: BauhausColors.surface,
        border: Border(
          top: BorderSide(
            color: BauhausColors.ink,
            width: BauhausTheme.borderWidth,
          ),
        ),
      ),
      child: Column(
        children: [
          // Top Bauhaus Tri-Color Stripe
          Row(
            children: [
              Expanded(flex: 3, child: Container(height: 6, color: BauhausColors.vermilion)),
              Expanded(flex: 2, child: Container(height: 6, color: BauhausColors.ochre)),
              Expanded(flex: 3, child: Container(height: 6, color: BauhausColors.cobalt)),
              Expanded(flex: 2, child: Container(height: 6, color: BauhausColors.sage)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : 20,
              vertical: 36,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBrandInfo(),
                          _buildQuickLinks(),
                          _buildSocialConnections(),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBrandInfo(),
                          const SizedBox(height: 24),
                          _buildQuickLinks(),
                          const SizedBox(height: 24),
                          _buildSocialConnections(),
                        ],
                      ),
              ),
            ),
          ),
          // Bottom copyright strip
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: BauhausColors.ink,
            ),
            child: const Center(
              child: Text(
                '© 2026 LAWRENCE HSIUNG — CRAFTED WITH FLUTTER & DART IN BAUHAUS STYLE',
                style: TextStyle(
                  color: BauhausColors.paper,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            BauhausShapeCluster(size: 16),
            SizedBox(width: 10),
            Text(
              'LAWRENCE HSIUNG',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: 0.8,
                color: BauhausColors.ink,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Multidisciplinary Systems & Electrical Engineer.\nSpecializing in hardware prototyping, EV systems, & autonomous robotics.',
          style: TextStyle(
            fontSize: 13,
            color: BauhausColors.muted,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'NAVIGATION',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1.2,
            color: BauhausColors.ink,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _footerLink('Home', '/'),
            _footerLink('Portfolio', '/portfolio'),
            _footerLink('Blog', '/blog'),
            _footerLink('Résumé', '/resume'),
          ],
        ),
      ],
    );
  }

  Widget _footerLink(String label, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavigate(route),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: BauhausColors.cobalt,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialConnections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CONNECT',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1.2,
            color: BauhausColors.ink,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _socialButton(BrandIconType.linkedIn, 'LinkedIn', () => UrlHelper.launch(UrlHelper.linkedIn)),
            const SizedBox(width: 8),
            _socialButton(BrandIconType.instagram, 'Instagram', () => UrlHelper.launch(UrlHelper.instagram)),
            const SizedBox(width: 8),
            _socialButton(BrandIconType.github, 'GitHub', () => UrlHelper.launch(UrlHelper.github)),
            const SizedBox(width: 8),
            _socialButton(BrandIconType.email, 'Email', () => UrlHelper.launch(UrlHelper.email)),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(BrandIconType type, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
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
            child: BrandIcon(type: type, size: 14, color: BauhausColors.ink),
          ),
        ),
      ),
    );
  }
}
