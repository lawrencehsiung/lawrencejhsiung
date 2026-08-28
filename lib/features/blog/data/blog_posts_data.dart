import '../models/blog_post.dart';

class BlogPostsData {
  static const List<BlogPost> posts = [
    BlogPost(
      id: 'ev-showcar-electrical-architecture',
      title: 'Architecting Low-Voltage Electrical Systems for Concept Showcars',
      subtitle:
          'Balancing rapid iterative design cycles with production-grade reliability on high-visibility automotive prototypes.',
      category: 'Systems Engineering',
      date: 'Aug 2026',
      readTime: '6 min read',
      coverImage: 'assets/images/cosmosint.avif',
      tags: ['EV Systems', 'Automotive', 'Prototyping', 'Power Architecture'],
      sections: [
        BlogSection(
          heading: 'The Showcar Paradigm: Speed vs. Robustness',
          content:
              'Concept showcars occupy a unique intersection in automotive engineering. Unlike production vehicles that benefit from multi-year validation cycles, concept vehicles demand ultra-rapid turnaround while operating under unforgiving public scrutiny. If an interior ambient lighting rail flickers or a digital cluster drops CAN frames during a global live unveiling, there is no second take.\n\nWhen architecting low-voltage (12V/48V) electrical topologies for showcars like the Lucid Cosmos and Earth platforms, the primary objective is modular decoupling: creating power and communication distribution blocks that can be easily modified without cascading failures across the vehicle network.',
          callout:
              'Key Rule: In prototype builds, isolate critical vehicle state machines from non-critical experiential lighting and infotainment loads using dedicated solid-state power switches.',
        ),
        BlogSection(
          heading: 'Modular Harnessing & Wire Routing',
          content:
              'Traditional automotive harnesses are wrapped into rigid, irreversible bundles with complex overmolds. For rapid prototypes, we adopt a modular backbone strategy:\n\n1. Central Power & Logic Hub: A custom enclosure housing solid-state e-fuses, CAN/LIN gateway routers, and microcontroller breakout boards.\n2. Sub-System Runs: Quick-disconnect Deutsche and Amphenol connectors routing to doors, center consoles, and roof modules.\n3. Dynamic Diagnostics: Built-in current sense telemetry reporting real-time draw per channel over USB/Ethernet to diagnostic laptops.',
        ),
        BlogSection(
          heading: 'Tackling Ground Loops & EMI in Tight Enclosures',
          content:
              'In concept interiors, high-density RGB LED drivers, motorized displays, and inductive chargers sit in close proximity to sensitive low-signal sensor lines. Establishing a strict star-grounding architecture and using twisted shielded pairs for all differential communication lines prevents unexpected audio hum or serial bus corruption.',
          callout:
              'A clean wiring harness is not just aesthetic—it is the best debugging tool you have at 2:00 AM before auto show load-in.',
        ),
      ],
    ),
    BlogPost(
      id: 'field-testing-autonomous-robots',
      title: 'Field-Testing Autonomous Robots in Harsh Agricultural Realities',
      subtitle:
          'Why computer vision algorithms and micro-actuators behave very differently in 105°F Arizona dust than in the lab.',
      category: 'Autonomous Tech',
      date: 'Jul 2026',
      readTime: '8 min read',
      coverImage: 'assets/images/farmwisevulcan.jpg',
      tags: ['Robotics', 'Ag-Tech', 'Hardware Validation', 'Embedded Systems'],
      sections: [
        BlogSection(
          heading: 'The Gap Between Bench & Field',
          content:
              'In the laboratory, power supplies deliver pristine 24.00V DC, temperatures hover at a comfortable 72°F, and cameras capture perfectly lit targets against clean backgrounds. In the crop fields of Salinas or Yuma, the reality is starkly different: fine silicate dust penetrates standard IP ratings, ambient ground temperatures exceed 115°F, and high-frequency tractor vibrations shake connector pins loose.',
        ),
        BlogSection(
          heading: 'Engineering the IPS Box (Intelligent Power System)',
          content:
              'During our development of the Farmwise Vulcan smart weeding robot, one of our critical milestones was designing the Intelligent Power System (IPS Box). The system had to manage power delivery to heavy hydraulic solenoids, high-speed camera strobe arrays, and onboard Jetson compute modules while enduring severe mechanical shocks.',
          callout:
              'Thermal throttling in agricultural robotics does not just slow down compute—it causes latency spikes that lead to mechanical blades clipping crops instead of weeds.',
        ),
        BlogSection(
          heading: 'Test Strategies That Actually Prevent Field Disasters',
          content:
              'Through hundreds of hours of field trials, we developed a 3-tier validation checklist:\n\n• Thermal Soak & Shake: Subjecting full PCBA enclosures to thermal cycling while undergoing multi-axis vibration testing.\n• Brownout Simulation: Testing transient load drops when all cutting actuators fire simultaneously under low alternator output.\n• Redundant Watchdogs: Implementing independent hardware watchdog ICs that safely retract cutting blades within 15 milliseconds if compute heartbeats stall.',
        ),
      ],
    ),
    BlogPost(
      id: 'film-photography-and-systems-engineering',
      title: 'The Mechanical Discipline of Film Photography: An Engineer\'s Perspective',
      subtitle:
          'What mechanical shutters, optical grain, and chemical chemistry teach us about modern systems engineering.',
      category: 'Film Photography',
      date: 'May 2026',
      readTime: '5 min read',
      coverImage: 'assets/images/me.jpeg',
      tags: ['Film Photography', 'Optics', 'Analog', 'Philosophy'],
      sections: [
        BlogSection(
          heading: 'The Tangible Feedback of Physical Systems',
          content:
              'In modern software and digital electronics, feedback loops are instantaneous and virtually infinite. If a line of code has a bug, you recompile. If a digital exposure is slightly underexposed, you push shadows in Lightroom by 3 stops with zero penalty.\n\nAnalog film photography enforces the opposite discipline: you have 36 exposures per roll (or 10 on medium format 6x7), a purely mechanical shutter calibrated by clockwork escapements, and chemical emulsion that permanently records every decision you make.',
        ),
        BlogSection(
          heading: 'Constraints Breed Deliberate Engineering',
          content:
              'Operating a manual mechanical camera requires calculating exposure triangles, evaluating lighting dynamic range, and checking depth of field before cocking the shutter. This exact mindset translates directly to hardware engineering:\n\n• Respecting Physical Tolerances: Understanding thermal expansion in metal gears mirrors analyzing PCB trace thermal limits.\n• Deliberate Architecture: Committing to a design only after measuring and double-checking assumptions, rather than relying on rapid trial-and-error.',
          callout:
              'When every exposure carries a tangible physical cost, you learn to observe deeply before taking action.',
        ),
        BlogSection(
          heading: 'Check Out My Photographic Work',
          content:
              'I shoot with a variety of 35mm and medium format cameras, exploring urban architecture, industrial textures, and natural landscapes. You can explore my daily film diary on Instagram at @film.foto.lan.',
        ),
      ],
    ),
    BlogPost(
      id: 'failure-analysis-wearables',
      title: 'Failure Mode Analysis in Wearable Consumer Hardware',
      subtitle:
          'Uncovering subtle electrical shorts, battery degradation modes, and optical sensor anomalies on micro-scale PCBAs.',
      category: 'Hardware & Validation',
      date: 'Mar 2026',
      readTime: '7 min read',
      coverImage: 'assets/images/versa2.jpg',
      tags: ['Wearables', 'Failure Analysis', 'PCB Testing', 'Sensors'],
      sections: [
        BlogSection(
          heading: 'The Unforgiving Constraints of Wearable Electronics',
          content:
              'Designing wearable electronics like the Fitbit Versa and Inspire series involves packing multi-core processors, Bluetooth transceivers, optical PPG sensor arrays, and LiPo battery protection circuits into a chassis smaller than a matchbox. With components spaced fractions of a millimeter apart, traditional probing is impossible without specialized micro-station test jigs.',
        ),
        BlogSection(
          heading: 'Hunting Phantom Battery Drains',
          content:
              'One of the most elusive failure modes in consumer wearables is quiescent current leakage (sub-microamp parasitic drain). When a customer reports a smartwatch dying in 18 hours instead of 5 days, the culprit is often a single capacitor with microscopic dendritic growth or a PMIC buck converter failing to enter ultra-low-power sleep mode.',
          callout:
              'Automating multi-channel micro-ammeter data logging over 72-hour discharge cycles is the only reliable way to pinpoint sporadic wake-up interrupts.',
        ),
        BlogSection(
          heading: 'Key Takeaways for Hardware Reliability',
          content:
              '1. Design for Testability (DFT): Never sacrifice test pads for aesthetic layout convenience; you will need them when yield drops.\n2. Environmental Stress Screening: Combine humidity, sweat simulation, and thermal shock during early DVT phases to expose flux residue corrosion early.\n3. Cross-Disciplinary Root Cause: Electrical engineers, mechanical packaging teams, and firmware developers must collaborate closely during FA teardowns.',
        ),
      ],
    ),
  ];
}
