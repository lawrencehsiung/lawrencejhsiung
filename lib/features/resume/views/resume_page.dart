import 'package:flutter/material.dart';
import '../../../core/theme/bauhaus_theme.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/bauhaus_badge.dart';
import '../../../core/widgets/bauhaus_button.dart';
import '../../../core/widgets/bauhaus_card.dart';
import '../../../core/widgets/geometric_decorations.dart';

class ResumePage extends StatelessWidget {
  final Function(String route) onNavigate;

  const ResumePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

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
                // Header
                const BauhausSectionHeading(
                  title: 'Curriculum Vitae & Résumé',
                  subtitle:
                      'Systems engineering timeline, technical proficiencies, education, and credentials.',
                  shape: BauhausShape.triangle,
                  accentColor: BauhausColors.sage,
                ),
                const SizedBox(height: 24),

                // Download Action Callout Card
                BauhausCard(
                  backgroundColor: BauhausColors.cobalt,
                  padding: const EdgeInsets.all(24),
                  child: isDesktop
                      ? Row(
                          children: [
                            const Icon(Icons.picture_as_pdf, color: Colors.white, size: 36),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'OFFICIAL PDF RÉSUMÉ AVAILABLE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Download Lawrence_Hsiung_Resume.pdf for printing, offline review, or recruitment.',
                                    style: TextStyle(color: BauhausColors.paper, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            BauhausButton(
                              label: 'Download PDF',
                              icon: Icons.download,
                              backgroundColor: BauhausColors.ochre,
                              textColor: BauhausColors.ink,
                              onPressed: () => UrlHelper.launch(UrlHelper.resumePdf),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'OFFICIAL PDF RÉSUMÉ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Download Lawrence_Hsiung_Resume.pdf for offline review.',
                              style: TextStyle(color: BauhausColors.paper, fontSize: 13),
                            ),
                            const SizedBox(height: 14),
                            BauhausButton(
                              label: 'Download PDF',
                              icon: Icons.download,
                              backgroundColor: BauhausColors.ochre,
                              textColor: BauhausColors.ink,
                              onPressed: () => UrlHelper.launch(UrlHelper.resumePdf),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 48),

                // Experience Timeline
                const Text(
                  'PROFESSIONAL EXPERIENCE',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: BauhausColors.ink,
                  ),
                ),
                const SizedBox(height: 20),
                _buildExperienceCard(
                  company: 'Lucid Motors',
                  role: 'Prototypes and Concepts Systems Engineer',
                  period: '2023 — Present',
                  location: 'Newark, CA',
                  accentColor: BauhausColors.vermilion,
                  bullets: [
                    'Architect and engineer complete low-voltage electrical systems for concept vehicle platforms including Lucid Cosmos & Earth.',
                    'Design custom rapid-prototyping wiring harnesses, solid-state power distribution blocks, and CAN/LIN communication nodes.',
                    'Integrate sensor and compute payloads for autonomous robotaxi and technology demonstrators (Lucid Gravity x Uber x Nuro).',
                    'Conduct live electrical validation and diagnostic support during global vehicle unveils and VIP demonstrations.',
                  ],
                  skills: ['EV Architecture', 'Harness Prototyping', 'CAN/LIN', 'Power Distribution', 'Rapid R&D'],
                ),
                const SizedBox(height: 24),

                _buildExperienceCard(
                  company: 'Farmwise Labs',
                  role: 'Product & Systems Engineer',
                  period: '2021 — 2023',
                  location: 'Salinas & San Francisco, CA',
                  accentColor: BauhausColors.sage,
                  bullets: [
                    'Designed and executed hardware test protocols for the Vulcan smart agricultural weeding robot.',
                    'Engineered the Intelligent Power System (IPS Box) for robust power routing, computer vision compute cooling, and actuator control.',
                    'Conducted field validation in desert and agricultural environments (110°F+ heat, high dust/vibration).',
                    'Formulated FMEA and root-cause failure analysis on micro-actuator precision cutting assemblies.',
                  ],
                  skills: ['Autonomous Robotics', 'Ag-Tech', 'Hardware Validation', 'Field Testing', 'Embedded Systems'],
                ),
                const SizedBox(height: 24),

                _buildExperienceCard(
                  company: 'Zoom Video Communications',
                  role: 'Audio Test Engineer',
                  period: '2020 — 2021',
                  location: 'San Jose, CA',
                  accentColor: BauhausColors.cobalt,
                  bullets: [
                    'Executed acoustic and electrical characterization tests inside anechoic chambers for microphones, speakers, and DSP processors.',
                    'Automated Zoom Hardware Certification test suites in Python, accelerating Tier-1 partner certification timelines.',
                    'Collaborated with hardware partners (Logitech, Poly, Crestron, Yealink) on AEC and beamforming performance.',
                  ],
                  skills: ['Acoustics', 'Hardware Cert', 'Python Automation', 'DSP / AEC'],
                ),
                const SizedBox(height: 24),

                _buildExperienceCard(
                  company: 'Fitbit',
                  role: 'Electrical Engineering Technician',
                  period: '2018 — 2020',
                  location: 'San Francisco, CA',
                  accentColor: BauhausColors.deepOchre,
                  bullets: [
                    'Built automated test benches for battery longevity, display power consumption, and optical sensor (PPG/SpO2) validation on Versa 1, 2, & 3.',
                    'Performed component-level failure analysis (FA) on prototype PCBAs using oscilloscopes, spectrum analyzers, and micro-probing.',
                    'Executed electrical stress testing on the Inspire & Inspire HR wearable trackers to ensure consumer reliability standards.',
                  ],
                  skills: ['Wearables', 'Failure Analysis', 'PCB Testing', 'Oscilloscopes', 'Sensor Validation'],
                ),
                const SizedBox(height: 48),

                // Education Section
                const Text(
                  'EDUCATION & CREDENTIALS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: BauhausColors.ink,
                  ),
                ),
                const SizedBox(height: 20),
                BauhausCard(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEducationItem(
                        institution: 'San Jose State University',
                        degree: 'M.S. in Electrical Engineering',
                        period: '2019 — 2021',
                        focus: 'Focus: Machine Learning, Advanced Power Systems & Control',
                      ),
                      const Divider(height: 32, thickness: 1.5, color: BauhausColors.ink),
                      _buildEducationItem(
                        institution: 'UC San Diego (UCSD)',
                        degree: 'B.S. in Electrical Engineering',
                        period: '2014 — 2018',
                        focus: 'Minor: Business Studies • Focus: Signals, Systems & Circuit Design',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // Technical Skills Grid
                const Text(
                  'TECHNICAL COMPETENCIES & TOOLKIT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: BauhausColors.ink,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSkillsGrid(isDesktop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard({
    required String company,
    required String role,
    required String period,
    required String location,
    required Color accentColor,
    required List<String> bullets,
    required List<String> skills,
  }) {
    return BauhausCard(
      padding: EdgeInsets.zero,
      enableHover: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: accentColor,
              border: const Border(
                bottom: BorderSide(color: BauhausColors.ink, width: 2),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    company.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                Text(
                  '$period • $location',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.95),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: BauhausColors.ink,
                  ),
                ),
                const SizedBox(height: 14),
                ...bullets.map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6, right: 10),
                          width: 6,
                          height: 6,
                          color: BauhausColors.ink,
                        ),
                        Expanded(
                          child: Text(
                            b,
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
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: skills.map((s) {
                    return BauhausBadge(
                      label: s,
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

  Widget _buildEducationItem({
    required String institution,
    required String degree,
    required String period,
    required String focus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              institution.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                letterSpacing: 0.5,
                color: BauhausColors.ink,
              ),
            ),
            Text(
              period,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: BauhausColors.muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          degree,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: BauhausColors.cobalt,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          focus,
          style: const TextStyle(fontSize: 13, color: BauhausColors.muted),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(bool isDesktop) {
    final skillCategories = [
      {
        'title': 'SYSTEMS & ELECTRICAL',
        'color': BauhausColors.vermilion,
        'items': [
          'Low-Voltage Electrical Architecture (12V/48V)',
          'Rapid Wire Harness Prototyping & Pinout Design',
          'CAN / LIN / Automotive Ethernet / SPI / I2C / UART',
          'Solid-State Power Distribution & e-Fuse Topology',
          'Failure Mode and Effects Analysis (FMEA)',
        ]
      },
      {
        'title': 'TEST & HARDWARE VALIDATION',
        'color': BauhausColors.cobalt,
        'items': [
          'Bench Bring-up & Component-Level FA',
          'Anechoic Chamber Acoustic Characterization',
          'Environmental Stress & Vibration Testing',
          'Oscilloscopes, Spectrum Analyzers, DMMs, Logic Analyzers',
          'Battery Life & Quiescent Current Leakage Profiling',
        ]
      },
      {
        'title': 'SOFTWARE & AUTOMATION',
        'color': BauhausColors.sage,
        'items': [
          'Python (Automated Test Scripts & Data Parsing)',
          'Flutter & Dart (Modern UI / Web Applications)',
          'MATLAB / Simulink',
          'Git / GitHub Actions CI/CD',
          'Altium Designer / KiCad Schematic Review',
        ]
      },
      {
        'title': 'CREATIVE & INTERDISCIPLINARY',
        'color': BauhausColors.ochre,
        'items': [
          'Analog Film Photography (35mm & 120 Format)',
          'Optical Principles & Physical Mechanics',
          'Concept Vehicle Prototyping',
          'Technical Writing & Cross-Team Leadership',
        ]
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = isDesktop ? (constraints.maxWidth - 20) / 2 : double.infinity;
        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: skillCategories.map((cat) {
            return SizedBox(
              width: cardWidth,
              child: BauhausCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          color: cat['color'] as Color,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          cat['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            letterSpacing: 0.8,
                            color: BauhausColors.ink,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ...(cat['items'] as List<String>).map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontWeight: FontWeight.w900)),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 13, color: BauhausColors.ink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
