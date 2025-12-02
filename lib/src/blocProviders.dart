// import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
// import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/bloc/ConfirmAccountBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/bloc/ForgotPasswordBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/bloc/ResendCodeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/bloc/ResetPasswordBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent()),
  ),
  BlocProvider<RolesBloc>(
    create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList()),
  ),
  BlocProvider<AdminHomeBloc>(
    create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ProfileInfoBloc>(
    create: (context) => ProfileInfoBloc(locator<AuthUseCases>())..add(ProfileInfoGetUser()),
  ),
  BlocProvider<ProfileUpdateBloc>(
    create: (context) => ProfileUpdateBloc(locator<AuthUseCases>())
  ),
  BlocProvider<ConfirmAccountBloc>(
    create: (context) => ConfirmAccountBloc(locator<AuthUseCases>())..add(ConfirmAccountInitEvent()),
  ),
  BlocProvider<ResendCodeBloc>(
    create: (context) => ResendCodeBloc(locator<AuthUseCases>())..add(ResendCodeInitEvent()),
  ),
  BlocProvider<ForgotPasswordBloc>(
    create: (context) => ForgotPasswordBloc(locator<AuthUseCases>())..add(ForgotPasswordInitEvent()),
  ),
  BlocProvider<ResetPasswordBloc>(
    create: (context) => ResetPasswordBloc(locator<AuthUseCases>())..add(ResetPasswordInitEvent()),
  ),
  BlocProvider<AdminCategoryCreateBloc>(
    create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCases>())..add(AdminCategoryCreateInitEvent()),
  ),
  BlocProvider<AdminCategoryListBloc>(
    create: (context) => AdminCategoryListBloc(locator<CategoriesUseCases>()),
  ),
  BlocProvider<AdminCategoryUpdateBloc>(
    create: (context) => AdminCategoryUpdateBloc(locator<CategoriesUseCases>()),
  ),
  BlocProvider<AdminProductCreateBloc>(
    create: (context) => AdminProductCreateBloc(locator<ProductsUseCases>())
  ),
  BlocProvider<AdminProductListBloc>(
    create: (context) => AdminProductListBloc(locator<ProductsUseCases>())
  ),
  BlocProvider<AdminProductUpdateBloc>(
    create: (context) => AdminProductUpdateBloc(locator<ProductsUseCases>())
  ),
];