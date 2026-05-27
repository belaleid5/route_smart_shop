class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? createdAt;

  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  String get displayName => (name?.trim().isNotEmpty ?? false) ? name!.trim() : 'No Name';
  String get displayEmail => email?.trim() ?? 'No Email';
  String get initial => 
      (name?.trim().isNotEmpty ?? false) ? name!.trim()[0].toUpperCase() : '?';
}