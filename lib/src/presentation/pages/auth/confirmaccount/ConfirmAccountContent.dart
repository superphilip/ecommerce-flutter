import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/bloc/ConfirmAccountBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/components/ButtonConfirmAccount.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/components/ConfirmPinPutCode.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmAccountContent extends StatelessWidget {
  ConfirmAccountBloc? bloc;
  ConfirmAccountState state;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController;
    final FocusNode pinFocusNode;

  ConfirmAccountContent(
        this.bloc, 
        this.state, 
        {
            required this.pinController,
            required this.pinFocusNode,
            super.key,
        }
    );

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultHeaderTextIcon('VALIDA TU EMAIL'),
                  const SizedBox(height: 60),
                  ConfirmPinPutCode(bloc, state, controller: pinController, focusNode: pinFocusNode),
                  const SizedBox(height: 60),
                  ButtonConfirmAccount(bloc, state, formKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
