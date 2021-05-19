import 'package:eclipse_app/domain/model/user.dart';
import 'package:eclipse_app/domain/repository/users_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._usersRepository);

  final UsersRepository _usersRepository;

  @action
  Future<List<User>> getUsers() async => await _usersRepository.getUsers();
}
