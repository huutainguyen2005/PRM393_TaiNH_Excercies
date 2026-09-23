import 'user_repository.dart';
import '../datasources/user_fake_datasource.dart';
import '../../models/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFakeDataSource dataSource;
  UserRepositoryImpl(this.dataSource);
  @override
  Future<List<User>> getUsers() {
    return dataSource.getUsers();
  }
}
