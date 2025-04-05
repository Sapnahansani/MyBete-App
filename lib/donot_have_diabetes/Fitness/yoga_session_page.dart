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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yoga Session')),
      body: SingleChildScrollView( // This allows scrolling if content exceeds screen height
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntroductionCard(),
              const SizedBox(height: 20),
              _buildSessionInstructions(),
              const SizedBox(height: 20),
              const Text(
                'Yoga Poses:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildYogaPoses(),
            ],
          ),
        ),
      ),
    );
  }

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
                color: Colors.blue,
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
          Icon(icon, color: Colors.blue),
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
