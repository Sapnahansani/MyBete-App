import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() {
  runApp(const YogaSessionPage());
}

=======
>>>>>>> 77b0e99c106b674a6350d9b40854320c8ea94e5b
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
      videoUrl: 'assets/videos/5 Minute Push Ups Workout at Home.mp4',
    ),
    YogaPose(
      name: 'Downward Dog (Adho Mukha Svanasana)',
      duration: '7 mins',
      icon: Icons.architecture,
      videoUrl: 'assets/videos/downward_dog.mp4',
    ),
    YogaPose(
      name: 'Warrior II (Virabhadrasana II)',
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
<<<<<<< HEAD
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
=======
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Yoga Session',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildPosesList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mindful\nYoga\nPractice',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Improve flexibility, balance, and mental focus through our curated yoga sessions. Follow along with our video guides for proper form and technique.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatBadge('4', 'POSES'),
              _buildStatBadge('22', 'MINUTES'),
              _buildStatBadge('Beginner', 'LEVEL'),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildStatBadge(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosesList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Yoga Poses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _poses.length,
              itemBuilder: (context, index) {
                return _buildPoseItem(_poses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoseItem(YogaPose pose) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: lightBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            pose.icon,
            color: primaryBlue,
            size: 24,
          ),
        ),
        title: Text(
          pose.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
        ),
        subtitle: Text(
          pose.duration,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: primaryBlue,
        ),
        onTap: () {
          // Navigate to pose detail page
          _showPoseDetail(pose);
        },
      ),
    );
  }

  void _showPoseDetail(YogaPose pose) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pose.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pose.duration,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Follow along with the video guide for proper form and technique. '
                    'Remember to breathe deeply and move slowly into each position.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Start pose video
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Start Practice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
  final IconData icon;
  final String videoUrl;

  YogaPose({
    required this.name,
    required this.duration,
    required this.icon,
    required this.videoUrl,
  });
} 
>>>>>>> 77b0e99c106b674a6350d9b40854320c8ea94e5b
