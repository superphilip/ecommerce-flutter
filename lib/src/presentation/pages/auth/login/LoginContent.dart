import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/components/components.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;
  final GlobalKey<FormState> formKey;

  LoginContent(this.bloc, this.state, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultImageBackGround('assets/img/background3.jpg'),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultHeaderTextIcon('LOGIN'),
                  TextFieldEmailLogin(bloc, state),
                  TextFieldPasswordLogin(bloc, state),
                  ButtonLogin(bloc, state, formKey),
                  DefaultTextfieldResendCode(),
                  ButtonGoToRegister(),
                  TextLoginForgotPassword(),          
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
