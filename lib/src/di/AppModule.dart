// import 'package:ecommerce_flutter/src/data/Repository/UsersRepositoyImpl.dart';
import 'package:ecommerce_flutter/src/data/Repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/Repository/ProductsRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/Repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/authService/AuthService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/categoriesService/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseService/HttpClientImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/productsService/ProductsService.dart';
// import 'package:ecommerce_flutter/src/data/dataSource/remote/services/userService/UsersService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';
// import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ConfirmAccountUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ForgotPasswordUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ResendCodeUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ResetPasswordUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductsUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/DeleteProductsUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/UpdateProductsUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  HttpClientImpl get httpClient => HttpClientImpl.fromSharedPref(sharedPref);
  
  @injectable
  AuthService get authService => AuthService(httpClient);

  // @injectable
  // UsersService get usersService => UsersService(httpClient);

  @injectable
  CategoriesService get categoriesService => CategoriesService(httpClient);

  @injectable
  ProductsService get productsService => ProductsService(httpClient);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService, sharedPref);

  @injectable
  ProductsRepository get productsRepository => ProductsRepositoryImpl(productsService);

  // @injectable
  // UsesRepository get usesRepository => UsersRepositoyImpl(usersService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
    updateUser: UpdateUserUseCase(authRepository),
    confirmAccount: ConfirmAccountUseCase(authRepository),
    resendCode: ResendCodeUseCase(authRepository),
    forgotPassword: ForgotPasswordUseCase(authRepository),
    resetPassword: ResetPasswordUseCase(authRepository)
  );

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
    create: CreateCategoryUseCase(categoriesRepository),
    getCategories: GetCategoriesUseCase(categoriesRepository),
    update: UpdateCategoryUseCase(categoriesRepository),
    delete: DeleteCategoryUseCase(categoriesRepository),
  );

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
    create: CreateProductsUseCase(productsRepository),
    getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
    update: UpdateProductsUseCase(productsRepository),
    delete: DeleteProductsUseCase(productsRepository),
  );
}