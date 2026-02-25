import 'package:flutter/material.dart';
import '../models/guide.dart';

// A reusable widget to display a single Guide in a list.
class GuideCard extends StatelessWidget {
  final Guide guide;
  final VoidCallback onTap;

  const GuideCard({
    super.key,
    required this.guide,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // The InkWell adds a nice ripple effect when tapping the card
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Hero widget allows for smooth image transition to the details page later
              Hero(
                tag: 'guide_photo_${guide.id}',
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(guide.photoUrl),
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
              const SizedBox(width: 16),
              // Expanded ensures the text takes up remaining space and doesn't overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      guide.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Adds "..." if text is too long
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
