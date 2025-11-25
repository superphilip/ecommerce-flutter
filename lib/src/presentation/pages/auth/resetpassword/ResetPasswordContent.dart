import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/bloc/ResetPasswordBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/components/ButtonReset.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/components/TextFieldPasswordReset.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordContent extends StatelessWidget {
  ResetPasswordBloc? bloc;
  ResetPasswordState state;
  final GlobalKey<FormState> formKey;
  
  ResetPasswordContent(this.bloc, this.state, this.formKey, {super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultHeaderTextIcon('RESETEAR CONTRASEÑA'),
                  const SizedBox(height: 20),
                  TextFieldPasswordReset(bloc, state),
                  const SizedBox(height: 20),
                  ButtonReset(bloc, state, formKey),
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
        ],
      ),
    );
  }
}