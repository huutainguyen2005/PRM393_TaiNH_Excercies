import '../../models/user.dart';

class UserFakeDataSource {
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return [User(id: 1, name: 'Alice'), User(id: 2, name: 'Bob')];
  }
}
