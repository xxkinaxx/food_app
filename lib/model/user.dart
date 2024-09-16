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
  houseNumber: '2143262362',
  city: 'Itsakatchi',
  picturePath: 'https://i.pinimg.com/564x/35/8e/dc/358edc77f26d0480b69fe72d65ac917e.jpg',
);
