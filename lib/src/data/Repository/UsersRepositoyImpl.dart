

import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/userService/UsersService.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';

class UsersRepositoyImpl implements UsesRepository {
  UsersService usersService;
  SharedPref sharedPref;

  UsersRepositoyImpl(this.usersService, this.sharedPref);
}