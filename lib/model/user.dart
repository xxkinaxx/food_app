part of 'models.dart';

class User extends Equatable{
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? phoneNumber;
  final String? houseNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.houseNumber,
    this.city,
    this.picturePath,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
    String? houseNumber,
    String? city,
    String? picturePath,
}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    houseNumber: data['houseNumber'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturePath: data['profile_photo_url'],
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    phoneNumber,
    houseNumber,
    city,
    picturePath
  ];
}

User mockUser = User(
  id: 1,
  name: 'Kina mekoichi',
  email: 'Kina.2022@gmail.com',
  address: 'Jl.Akatsuki',
  phoneNumber: '08254177521',
  houseNumber: 'A022',
  city: 'Itsakatchi',
  picturePath: 'https://i.pinimg.com/564x/35/8e/dc/358edc77f26d0480b69fe72d65ac917e.jpg',
);
