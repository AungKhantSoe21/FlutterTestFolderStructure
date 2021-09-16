class User {
  String name;
  String email;
  String username;

  User(
    this.name,
    this.email,
    this.username
  );

  @override
  String toString(){
    return 'User {name: $name, email: $email, username: $username}';
  }
}