import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/ResendCodeContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/bloc/ResendCodeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResendCodePage extends StatefulWidget {
  const ResendCodePage({super.key});

  @override
  State<ResendCodePage> createState() => _ResendCodePageState();
}

class _ResendCodePageState extends State<ResendCodePage> {
  ResendCodeBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ResendCodeBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocListener<ResendCodeBloc, ResendCodeState>(
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
                _bloc?.add(ResendCodeReset());
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
            child: BlocBuilder<ResendCodeBloc, ResendCodeState>(
              builder: (context, state) {
                final responseState = state.response;
                if (responseState is Loading) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      ResendCodeContent(_bloc, state),
                      Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    ResendCodeContent(_bloc, state),
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