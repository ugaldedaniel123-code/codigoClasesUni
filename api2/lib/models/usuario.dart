class Usuario {

  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;

  Usuario({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
});

factory Usuario.fromJson(Map<String, dynamic> json){
  return Usuario(
    id:json['id'],
    name:json['name'],
    email:json['mail'],
    phone:json['phone'],
    website:json['website']
    );
}
}