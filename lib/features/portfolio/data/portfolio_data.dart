import '../models/project_item.dart';

class PortfolioData {
  static const List<ProjectItem> projects = [
    ProjectItem(
      id: 'lucid-motors',
      company: 'Lucid Motors',
      role: 'Prototypes & Concepts Systems Engineer',
      period: '2023 — Present',
      logoPath: 'assets/images/lucidlogo.png',
      invertLogo: true,
      category: 'EV & Prototyping',
      summary:
          'Architecting, building, and validating next-generation electrical and compute platforms for advanced concept vehicles, showcar fleet deployments, and autonomous vehicle integration.',
      tags: [
        'EV Architecture',
        'Showcar Systems',
        'Rapid Prototyping',
        'CAN / LIN / Ethernet',
        'Hardware Integration',
        'Robotaxi Platforms',
      ],
      highlights: [
        'Architected and integrated complete low-voltage electrical systems for the Lucid Cosmos and Earth concept platforms.',
        'Designed custom rapid-prototyping wiring harnesses, power distribution modules, and interactive showcar controls.',
        'Integrated sensor and compute payloads for autonomous robotaxi and technology demonstrators including Lucid Gravity x Uber x Nuro.',
        'Developed diagnostic scripts and automated bring-up workflows for multi-vehicle show fleets across global unveilings.',
      ],
      gallery: [
        GalleryMedia(
          imagePath: 'assets/images/cosmosint.avif',
          title: 'Lucid Cosmos & Earth Concept',
          description:
              'Integrated electrical systems, interior ambient controls, and digital interface power architecture.',
        ),
        GalleryMedia(
          imagePath: 'assets/images/lucidlunar.png',
          title: 'Lunar Robotaxi Concept',
          description:
              'Autonomous vehicle concept packaging, sensor compute integration, and redundant power distribution design.',
        ),
        GalleryMedia(
          imagePath: 'assets/images/ubergravity.avif',
          title: 'Lucid Gravity x Uber x Nuro Concept',
          description:
              'Hardware integration and electrical interface development for autonomous ride-hail and delivery fleets.',
        ),
      ],
    ),
    ProjectItem(
      id: 'farmwise',
      company: 'Farmwise Labs',
      role: 'Product & Systems Engineer',
      period: '2021 — 2023',
      logoPath: 'assets/images/farmwise.png',
      category: 'Autonomous Robotics',
      summary:
          'Designed and executed end-to-end hardware test methodologies for the Vulcan smart autonomous weeding robot, optimizing sub-millimeter actuator accuracy and field reliability.',
      tags: [
        'Autonomous Robotics',
        'Ag-Tech',
        'Hardware Validation',
        'Sensor Integration',
        'Power Systems',
        'Field Testing',
      ],
      highlights: [
        'Spearheaded hardware validation protocols for the Vulcan smart agricultural weeding robot across harsh farming environments.',
        'Engineered the Intelligent Power System (IPS Box) for robust power routing, computer vision compute cooling, and actuator control.',
        'Formulated failure mode analysis (FMEA) for sub-millimeter precision camera and mechanical blade cutting mechanisms.',
        'Conducted extensive live field testing in California and Arizona crop fields to ensure 99.9% uptime during harvest cycles.',
      ],
      gallery: [
        GalleryMedia(
          imagePath: 'assets/images/farmwisevulcan.jpg',
          title: 'Vulcan Smart Weeding Robot',
          description:
              'Sub-millimeter autonomous agricultural implement combining computer vision with high-speed micro-actuators.',
        ),
        GalleryMedia(
          imagePath: 'assets/images/ipsbox.png',
          title: 'Intelligent Power System (IPS Box)',
          description:
              'Ruggedized compute and power distribution enclosure designed to withstand extreme dust, heat, and vibration.',
        ),
      ],
    ),
    ProjectItem(
      id: 'zoom',
      company: 'Zoom Video Communications',
      role: 'Audio Test Engineer',
      period: '2020 — 2021',
      logoPath: 'assets/images/zlogo.png',
      category: 'Audio & Communications',
      summary:
          'Validated, tested, and certified enterprise and consumer audio hardware devices for the Zoom Rooms and Zoom Phone ecosystem.',
      tags: [
        'Acoustic Testing',
        'Hardware Certification',
        'Test Automation',
        'Signal Processing',
        'Quality Assurance',
      ],
      highlights: [
        'Executed acoustic and electrical characterization tests inside anechoic chambers for microphones, speakers, and DSP processors.',
        'Automated Zoom Hardware Certification test suites in Python, reducing partner testing turnaround from weeks to days.',
        'Collaborated with global Tier-1 hardware partners (Logitech, Poly, Crestron, Yealink) to resolve AEC (Acoustic Echo Cancellation) and beamforming anomalies.',
      ],
      gallery: [
        GalleryMedia(
          imagePath: 'assets/images/zcert3.webp',
          title: 'Zoom Hardware Certification Platform',
          description:
              'Acoustic characterization, frequency response testing, and compliance certification for Zoom-certified hardware devices.',
        ),
      ],
    ),
    ProjectItem(
      id: 'fitbit',
      company: 'Fitbit',
      role: 'Electrical Engineering Technician',
      period: '2018 — 2020',
      logoPath: 'assets/images/fitbitlogowhite.png',
      category: 'Wearables & Consumer Tech',
      summary:
          'Conducted hardware validation, circuit characterization, and failure analysis for Fitbit Versa and Inspire smartwatch product lines.',
      tags: [
        'Consumer Electronics',
        'Bench Characterization',
        'Failure Analysis (FA)',
        'PCB Bring-up',
        'Optical Sensors',
      ],
      highlights: [
        'Built automated test benches for battery longevity, display power consumption, and optical sensor (PPG/SpO2) validation on Versa 1, 2, & 3.',
        'Performed component-level failure analysis (FA) on prototype PCBAs using oscilloscopes, spectrum analyzers, and micro-probing.',
        'Executed rigorous electrical stress testing on the Inspire & Inspire HR wearable trackers to ensure consumer reliability standards.',
      ],
      gallery: [
        GalleryMedia(
          imagePath: 'assets/images/versa2.jpg',
          title: 'Fitbit Versa 1, 2, & 3 Validation',
          description:
              'Electrical validation test bench for sensor telemetry, power management ICs, and display controller characterization.',
        ),
        GalleryMedia(
          imagePath: 'assets/images/inspirehr.webp',
          title: 'Fitbit Inspire HR Validation Testing',
          description:
              'Optical heart rate sensor testing and reliability verification under dynamic environmental stress conditions.',
        ),
      ],
    ),
  ];
}
