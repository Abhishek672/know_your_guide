import 'package:flutter/material.dart';
import '../models/guide.dart';

class GuideDetailScreen extends StatelessWidget {
  final Guide guide;

  // We require the guide object to be passed in when this screen is opened
  const GuideDetailScreen({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A stylish AppBar that becomes transparent to show the photo behind it
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // White back button
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Section: The Guide's Photo
            // Hero tag must match the one in GuideCard for the smooth animation
            Hero(
              tag: 'guide_photo_${guide.id}',
              child: Image.network(
                guide.photoUrl,
                height: 350,
                fit: BoxFit.cover,
                // A subtle gradient overlay makes the white back button always visible 
                // regardless of how bright the photo is
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            
            // Bottom Section: Details in a card-like layout
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0), // Pulls it up over the image
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and verifying badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          guide.name,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.verified,
                        color: Theme.of(context).colorScheme.primary,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Description
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    guide.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Contact Info Section
                  Text(
                    'Contact Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Reusable contact rows
                  _buildContactRow(context, Icons.phone, guide.contact),
                  const SizedBox(height: 12),
                  _buildContactRow(context, Icons.email, guide.email),
                  const SizedBox(height: 12),
                  _buildContactRow(context, Icons.camera_alt, guide.instaHandle),
                  
                  const SizedBox(height: 40),
                  
                  // Future "Book Now" Button Placeholder
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        // Action for future booking feature
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Booking feature coming soon!')),
                        );
                      },
                      child: const Text(
                        'Book this Guide',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  // A helper method to keep our UI code clean and avoid repeating rows
  Widget _buildContactRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
