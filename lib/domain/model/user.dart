import 'package:eclipse_app/data/api/model/api_user.dart';
import 'package:meta/meta.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.address,
    @required this.phone,
    @required this.website,
    @required this.company,
  });
}
