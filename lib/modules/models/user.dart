import 'dart:convert';

class User {
  final String name;
  final String? photoUrl;

  User({
    required this.name,
    this.photoUrl,
  });

  User copyWith({
    String? name,
    String? photoUrl,
  }) {
    return User(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => name.hashCode ^ photoUrl.hashCode;
}
