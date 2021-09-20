class User {
  int id;
  String name;
  String email;
  String username;

  User(
    this.id,
    this.name,
    this.email,
    this.username
  );

  @override
  String toString(){
    return 'User {id: $id ,name: $name, email: $email, username: $username}';
  }
}