import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/components/components.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';


class RegisterContent extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  RegisterContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultImageBackGround('assets/img/background3.jpg'),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultHeaderTextIcon('REGISTRO'),
                  TextFieldNameRegister(bloc, state),
                  TextfieldLastNameRegister(bloc, state),
                  TextFieldEmailRegister(bloc, state),
                  TextFieldPhoneRegister(bloc, state),
                  TextFieldPasswordRegister(bloc, state),
                  TextfieldConfirmPassword(bloc, state),
                  ButtonRegister(bloc, state),
                ],
              ),
            ),
          ),
          DefaultIconBack(
            left: 45,
            top: 150,
          ),
        ],
      ),
    );
  }
}
