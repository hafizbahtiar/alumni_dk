class UserModel {
  final String id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? department;
  final String? graduationYear;

  UserModel({required this.id, this.name, this.email, this.avatarUrl, this.department, this.graduationYear});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatar_url'],
      department: json['department'],
      graduationYear: json['graduation_year']?.toString(),
    );
  }
}
