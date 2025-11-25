import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/bloc/ForgotPasswordBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/components/ButtonForgotPassword.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/components/TextFieldEmailForgotPassword.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';

class ForgotPasswordContent extends StatelessWidget {
  ForgotPasswordBloc? bloc;
  ForgotPasswordState state;
  ForgotPasswordContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultHeaderTextIcon(
                  'Reestablecer contraseña',        
                ),
                const SizedBox(height: 30),
                TextfieldEmailForgotPassword(bloc, state),
                const SizedBox(height: 30),
                ButtonForgotPassword(bloc, state),
              ],
            ),
          ),
          DefaultIconBack(left: 45, top: 150),
        ],
      ),
    );
  }
}
