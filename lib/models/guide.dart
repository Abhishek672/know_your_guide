class Guide {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String instaHandle;
  final String description;
  final String photoUrl;

  // Constructor requires all fields to be provided when creating a Guide.
  Guide({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.instaHandle,
    required this.description,
    required this.photoUrl,
  });

  // Factory method to create a Guide object from a JSON map (e.g., from Firebase).
  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      contact: json['contact'] as String? ?? '',
      instaHandle: json['instaHandle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
    );
  }

  // Converts a Guide object into a JSON map (to save back to Firebase).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'contact': contact,
      'instaHandle': instaHandle,
      'description': description,
      'photoUrl': photoUrl,
    };
  }
}
