import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/bloc/ResendCodeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/components/ButtonResendCode.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/components/TextFieldEmailResendCode.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResendCodeContent extends StatelessWidget {
  ResendCodeBloc? bloc;
  ResendCodeState state;
  ResendCodeContent(this.bloc, this.state, {super.key});

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
                  'REENVIAR CODIGO DE CONFIRMACIÓN',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextfieldEmailResendCode(bloc, state),
                const SizedBox(height: 30),
                ButtonResendCode(bloc, state),
              ],
            ),
          ),
          DefaultIconBack(left: 45, top: 150),
        ],
      ),
    );
  }
}
