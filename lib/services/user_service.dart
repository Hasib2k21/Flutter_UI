import '../models/user.dart';

class UserService {
  Future<User> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network request
    return User(id: '1', email: email, name: 'User Name', token: 'sample_token');
  }

  Future<User> register(String email, String password, String name) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network request
    return User(id: '1', email: email, name: name, token: 'sample_token');
  }
}
