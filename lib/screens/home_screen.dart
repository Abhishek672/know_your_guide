import 'package:flutter/material.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/guide_card.dart';
import '../repositories/guide_repository.dart';
import '../models/guide.dart';
import 'guide_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GuideRepository _repository = GuideRepository();
  
  // Future variable to hold the fetching task
  late Future<List<Guide>> _guidesFuture;

  @override
  void initState() {
    super.initState();
    // Start fetching guides as soon as the screen loads
    _guidesFuture = _repository.getGuides();
  }

  void _onSearchChanged(String query) {
    // We will implement filtering logic here later
    print('Searching for: $query');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Know Your Guide'),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(
            // FutureBuilder watches the _guidesFuture and rebuilds 
            // the UI automatically as data arrives (loading -> error -> success)
            child: FutureBuilder<List<Guide>>(
              future: _guidesFuture,
              builder: (context, snapshot) {
                // State 1: Still waiting for data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                // State 2: An error occurred
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading guides: ${snapshot.error}'));
                }

                // State 3: Data successfully loaded
                final guides = snapshot.data ?? [];
                
                if (guides.isEmpty) {
                  return const Center(child: Text('No guides found.'));
                }

                // ListView.builder efficiently creates cards only for what's visible on screen
                return ListView.builder(
                  itemCount: guides.length,
                  itemBuilder: (context, index) {
                    final guide = guides[index];
                    return GuideCard(
                      guide: guide,
                      onTap: () {
                        // Navigate to the Details Screen, passing the selected guide object
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GuideDetailScreen(guide: guide),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
