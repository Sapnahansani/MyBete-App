import 'package:flutter/material.dart';

void main() {
  runApp(const YogaSessionPage());
}


class YogaSessionPage extends StatefulWidget {
  const YogaSessionPage({super.key});

  @override
  State<YogaSessionPage> createState() => _YogaSessionPageState();
}

class _YogaSessionPageState extends State<YogaSessionPage> {
  // Define our color scheme
  final Color primaryBlue = const Color(0xFF2196F3);
  final Color lightBlue = const Color(0xFF64B5F6);
  final Color darkBlue = const Color(0xFF1565C0);
  final Color backgroundColor = Colors.white;

  // List of yoga poses
  final List<YogaPose> _poses = [
    YogaPose(
      name: 'Mountain Pose (Tadasana)',
      duration: '5 mins',
      icon: Icons.landscape,
      videoUrl: '',
    ),
    YogaPose(
      name: 'Downward Dog (Adho Mukha Svanasana)',
      duration: '7 mins',
      icon: Icons.architecture,
      videoUrl: 'assets/videos/downward_dog.mp4',
    ),
    YogaPose(
      name: ' Child’s Pose (Balasana)',
      duration: '6 mins',
      icon: Icons.accessibility_new,
      videoUrl: 'assets/videos/warrior_pose.mp4',
    ),
    YogaPose(
      name: 'Tree Pose (Vrikshasana)',
      duration: '4 mins',
      icon: Icons.nature,
      videoUrl: 'assets/videos/tree_pose.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yoga Session')),
      body: const Center(child: Text('Yoga Session Page')),
    );
  }
}
class YogaPose {
  final String name;
  final String duration;
  final String benefits;
  final IconData icon;

  YogaPose({
    required this.name,
    required this.duration,
    required this.benefits,
    required this.icon,
  });
}
final List<YogaPose> _poses = [
  YogaPose(
    name: 'Mountain Pose',
    duration: '5 mins',
    benefits: 'Improves posture, reduces stress',
    icon: Icons.landscape,
  ),
  YogaPose(
    name: 'Downward Dog',
    duration: '7 mins',
    benefits: 'Strengthens arms and legs',
    icon: Icons.architecture,
  ),
  YogaPose(
    name: 'Warrior II',
    duration: '6 mins',
    benefits: 'Enhances balance and focus',
    icon: Icons.accessibility_new,
  ),
];
Widget _buildIntroductionCard() {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Mindful Yoga Practice',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Improve flexibility, balance, and mental focus through '
                'our curated yoga sessions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSessionInstructions() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Practice Guidelines:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      _buildInstructionStep('1. Find a quiet space', Icons.self_improvement),
      _buildInstructionStep('2. Use a yoga mat', Icons.airline_seat_flat),
      _buildInstructionStep('3. Focus on breathing', Icons.air),
    ],
  );
}

Widget _buildInstructionStep(String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 16),
        Expanded(child: Text(text)),
      ],
    ),
  );
}

  Widget _buildYogaPoses() {
    return Column(
      children: _poses.map((pose) => _buildYogaPoseCard(pose)).toList(),
    );
  }

  Widget _buildYogaPoseCard(YogaPose pose) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(pose.icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pose.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Duration: ${pose.duration}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pose.benefits,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YogaPose {
  final String name;
  final String duration;
  final String benefits;
  final IconData icon;

  YogaPose({
    required this.name,
    required this.duration,
    required this.benefits,
    required this.icon,
  });
}

final List<YogaPose> _poses = [
  YogaPose(
    name: 'Mountain Pose',
    duration: '5 mins',
    benefits: 'Improves posture, reduces stress',
    icon: Icons.landscape,
  ),
  YogaPose(
    name: 'Downward Dog',
    duration: '7 mins',
    benefits: 'Strengthens arms and legs',
    icon: Icons.architecture,
  ),
  YogaPose(
    name: 'Warrior II',
    duration: '6 mins',
    benefits: 'Enhances balance and focus',
    icon: Icons.accessibility_new,
  ),
];
