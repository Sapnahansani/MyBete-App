import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class L9RecipeDetailScreen extends StatefulWidget {
  const L9RecipeDetailScreen({Key? key}) : super(key: key);

  @override
  _L9RecipeDetailScreenState createState() => _L9RecipeDetailScreenState();
}

class _L9RecipeDetailScreenState extends State<L9RecipeDetailScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isSaving = false;
  bool _isAddingCalories = false;
  bool _recipeSaved = false;

  // Recipe data
  final String recipeName = 'Shrimp & Avocado Salad';
  final int calories = 400;
  final String category = 'lunch';

  // Get current user ID
  String? get currentUserId => _auth.currentUser?.uid;

  // Save recipe to user's saved recipes collection
  Future<void> _saveRecipe() async {
    if (_recipeSaved || _isSaving) return;

    setState(() {
      _isSaving = true;
    });

    try {
      if (currentUserId == null) {
        throw Exception('User not authenticated');
      }

      // Create recipe data
      Map<String, dynamic> recipeData = {
        'name': recipeName,
        'calories': calories,
        'category': category,
        'ingredients': [
          '½ cup cooked shrimp',
          '½ avocado (sliced)',
          '1 cup mixed greens',
          '½ cup cherry tomatoes (halved)',
          '1 tbsp olive oil',
          '1 tbsp lemon juice',
          'Salt & pepper to taste',

        ],
        'instructions': [
          'In a bowl, mix greens, shrimp, avocado, and cherry tomatoes.',
          'Drizzle with olive oil and lemon juice.',
          'Season with salt and pepper and enjoy!',
        ],
        'savedAt': FieldValue.serverTimestamp(),
        'imagePath': 'lib/donot_have_diabetes/meal_plans/meal_images/Shrimp & Avocado Salad.png',
      };

      // Add recipe to user's saved recipes
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('saved_recipes')
          .add(recipeData);

      setState(() {
        _recipeSaved = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recipe saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving recipe: $e')),
      );
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  // Add calories to user's daily intake
  Future<void> _addCaloriesToDailyIntake() async {
    if (_isAddingCalories) return;

    setState(() {
      _isAddingCalories = true;
    });

    try {
      if (currentUserId == null) {
        throw Exception('User not authenticated');
      }

      // Get today's date
      final now = DateTime.now();

      // Add to appropriate category collection
      await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('${category}_calories')
          .add({
        'name': recipeName,
        'calories': calories,
        'timestamp': Timestamp.fromDate(now),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Calories added to your daily intake!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding calories: $e')),
      );
    } finally {
      setState(() {
        _isAddingCalories = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/donot_have_diabetes/meal_plans/meal_images/Shrimp & Avocado Salad.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Semi-transparent overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),

                // Recipe content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 180), // Space for the image

                          // Recipe title container with rounded corners
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                const Text(
                                  'Shrimp & Avocado Salad',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 24),

                                // Ingredients
                                const Text(
                                  'Ingredients:',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,

                                  ),
                                ),
                                const SizedBox(height: 8),
                                _buildBulletPoint('½ cup cooked shrimp'),
                                _buildBulletPoint('½ avocado (sliced)'),
                                _buildBulletPoint('1 cup mixed greens'),
                                _buildBulletPoint('1 tbsp olive oil'),
                                _buildBulletPoint('1 tbsp lemon juice'),
                                _buildBulletPoint('Salt & pepper to taste'),


                                const SizedBox(height: 24),

                                // Instructions
                                const Text(
                                  'Instructions:',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,

                                  ),
                                ),
                                const SizedBox(height: 8),
                                _buildNumberedStep(1, 'In a bowl, mix greens, shrimp, avocado, and cherry tomatoes.'),
                                const SizedBox(height: 8),
                                _buildNumberedStep(2, 'Drizzle with olive oil and lemon juice.'),
                                const SizedBox(height: 8),
                                _buildNumberedStep(3, 'Season with salt and pepper and enjoy!'),


                                const SizedBox(height: 32),

                                // Bottom buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Calories button
                                    GestureDetector(
                                      onTap: _addCaloriesToDailyIntake,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF2E8B00),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: _isAddingCalories
                                            ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                            : const Text(
                                          '400 kcal',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Save button
                                    GestureDetector(
                                      onTap: _saveRecipe,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: _recipeSaved
                                              ? Colors.grey
                                              : const Color(0xFF4A90E2),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: _isSaving
                                            ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                            : Text(
                                          _recipeSaved ? 'Saved' : 'Save Recipe',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build bullet points
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build numbered steps
  Widget _buildNumberedStep(int number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}