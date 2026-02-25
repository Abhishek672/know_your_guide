import '../models/guide.dart';

// The Repository pattern acts as a central hub for all data fetching.
// Currently it provides mock data, but later we will create a 
// "FirebaseGuideRepository" that implements the same interface but fetches from the DB.
class GuideRepository {
  
  // Future is used because fetching data later (from Firebase/Network) takes time.
  // Using Future ensures our app doesn't freeze while waiting for data.
  Future<List<Guide>> getGuides() async {
    // Simulating a network delay so we can see loading states in our UI
    await Future.delayed(const Duration(seconds: 1));

    return [
      Guide(
        id: '1',
        name: 'Arjun Singh',
        email: 'arjun.explorer@email.com',
        contact: '+91 98765 43210',
        instaHandle: '@arjun_trails',
        description: 'Specializes in Himalayan treks and local cultural tours. '
            'With over 10 years of experience, Arjun knows the hidden gems of the mountains.',
        photoUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
        // Example mock image URL
      ),
      Guide(
        id: '2',
        name: 'Priya Sharma',
        email: 'priya.heritage@email.com',
        contact: '+91 87654 32109',
        instaHandle: '@priya_heritage',
        description: 'An expert in architectural history and Rajasthan royal palaces. '
            'She brings history to life with fascinating stories and local legends.',
        photoUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
      ),
      Guide(
        id: '3',
        name: 'Ravi Verma',
        email: 'ravi.wildlife@email.com',
        contact: '+91 76543 21098',
        instaHandle: '@ravi_inthewild',
        description: 'Wildlife enthusiast and certified naturalist. '
            'Ravi is your go-to guide for jungle safaris and bird watching expeditions.',
        photoUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
      ),
      Guide(
        id: '4',
        name: 'Neha Gupta',
        email: 'neha.foodie@email.com',
        contact: '+91 65432 10987',
        instaHandle: '@neha_tastetours',
        description: 'Curator of the best street food tours in Delhi. '
            'Experience the city through its vibrant and diverse culinary landscape.',
        photoUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
      ),
    ];
  }
}
