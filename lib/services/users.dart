class Users{
  int Uid;
  String Fname;
  String Lname;
  String Uname;
  String email;

  Users({ required this.Uid,required this.Fname, required this.Lname,required this.email,required this.Uname});
}

List<Users> users = [
  Users(Uid: 1, Fname: 'Godson', Lname: 'Ezekiel', email: 'godson@y4c.com', Uname: 'gezekiel'),
  Users(Uid: 2, Fname: 'Lisa', Lname: 'Jocktan', email: 'lisa@y4c.com', Uname: 'llocktan'),
  Users(Uid: 3, Fname: 'Tony', Lname: 'Rite', email: 'tony@y4c.com', Uname: 'trite'),
  Users(Uid: 4, Fname: 'Eliza', Lname: 'Rweikiza', email: 'eliza@y4c.com', Uname: 'Erweikiza'),
  Users(Uid: 5, Fname: 'Harun', Lname: 'Kimaro', email: 'harun@y4c.com', Uname: 'Hkimaro'),
  Users(Uid: 6, Fname: 'Imani', Lname: 'Majenda', email: 'imani@y4c.com', Uname: 'Imajenda')
];

