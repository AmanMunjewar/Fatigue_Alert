import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedGuideScreen extends StatelessWidget {
  const AnimatedGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Guides'),
      ),
      body: ListView(
        children: [
          _buildGuideItem(
            context,
            title: 'Deep Breathing',
            animationAsset: 'assets/animations/breathing.json',
          ),
          _buildGuideItem(
            context,
            title: 'Neck Stretches',
            animationAsset: 'assets/animations/neck_stretch.json',
          ),
          _buildGuideItem(
            context,
            title: 'Shoulder Rolls',
            animationAsset: 'assets/animations/shoulder_roll.json',
          ),
        ],
      ),
    );
  }

  Widget _buildGuideItem(BuildContext context, {required String title, required String animationAsset}) {
    return ListTile(
      leading: Lottie.asset(animationAsset, width: 50, height: 50),
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimationDetailScreen(
              title: title,
              animationAsset: animationAsset,
            ),
          ),
        );
      },
    );
  }
}

class AnimationDetailScreen extends StatelessWidget {
  final String title;
  final String animationAsset;

  const AnimationDetailScreen({
    super.key,
    required this.title,
    required this.animationAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Lottie.asset(animationAsset),
      ),
    );
  }
}