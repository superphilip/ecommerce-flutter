import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/ForgotPasswordContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/bloc/ForgotPasswordBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              final responseState = state.response;
              if (responseState is Error) {
                Fluttertoast.showToast(
                  msg: responseState.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              } else if (responseState is Success) {
                _bloc?.add(ForgotPasswordReset());
                Fluttertoast.showToast(
                  msg: responseState.message ?? '',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
                final responseState = state.response;
                if (responseState is Loading) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      ForgotPasswordContent(_bloc, state),
                      Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    ForgotPasswordContent(_bloc, state),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}