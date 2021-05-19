import 'package:eclipse_app/data/api/model/api_user.dart';
import 'package:eclipse_app/domain/model/user.dart';

class UserMapper {
  static List<User> fromApi(List<ApiUser> users) {
    return users
        .map<User>((user) => User(
              id: user.id,
              name: user.name,
              username: user.username,
              email: user.email,
              address: user.address,
              phone: user.phone,
              website: user.website,
              company: user.company,
            ))
        .toList();
  }
}
