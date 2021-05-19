import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/domain/model/user.dart';
import 'package:eclipse_app/domain/repository/users_repository.dart';

class UsersDataRepository extends UsersRepository {
  final ApiUtil _apiUtil;

  UsersDataRepository(this._apiUtil);

  @override
  Future<List<User>> getUsers() => _apiUtil.getUsers();
}
