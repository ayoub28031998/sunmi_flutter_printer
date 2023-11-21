class UserDTO {
  final String user;
  final String password;


  UserDTO({
    required this.user,
    required this.password,

  });

  Map<String, dynamic> toJson() {
    return {
      'codeArticle': user,
      'quantite': password,
    };
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      user: json['codeArticle'],
      password: json['quantite'],
    );
  }
}
