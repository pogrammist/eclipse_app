import 'package:eclipse_app/domain/model/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
