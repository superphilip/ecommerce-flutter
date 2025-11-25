import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/bloc/ConfirmAccountBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmPinPutCode extends StatelessWidget {
  ConfirmAccountBloc? bloc;
  ConfirmAccountState state;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller;
  final FocusNode focusNode;

  ConfirmPinPutCode(
    this.bloc,
    this.state, {
    required this.controller,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.white;
    const borderColor = Color.fromRGBO(232, 234, 237, 1);
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        // ⬅️ Color de letra
        fontSize: 20,
        color: focusedBorderColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller, // USAR el controller recibido
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      onChanged: (text) {},
      onCompleted: (text) {
        bloc?.add(
          ConfirmAccountNotificationToken(
            notificationToken: BlocFormItem(value: text),
          ),
        );
        FocusScope.of(context).unfocus();
      },
    );
    // validator: (value) => state.notificationToken.error,
  }
}
