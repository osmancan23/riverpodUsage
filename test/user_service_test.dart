import 'package:flutter_test/flutter_test.dart';
import 'package:riverpood_usage/home/service/user_service.dart';

void main() {
  late IUserService userService;
  setUp(() {
    userService = UserService();
  });
  test('Fetch All Users Test', () async {
    var users = await userService.fetchAllUsers();
    expect(users, isNotEmpty);
  });
}
