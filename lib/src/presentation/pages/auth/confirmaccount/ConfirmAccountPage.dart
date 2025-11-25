import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/ConfirmAccountContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/bloc/ConfirmAccountBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmAccountPage extends StatefulWidget {
  const ConfirmAccountPage({super.key});

  @override
  State<ConfirmAccountPage> createState() => _ConfirmAccountPageState();
}

class _ConfirmAccountPageState extends State<ConfirmAccountPage> {
  ConfirmAccountBloc? _bloc;
  late TextEditingController _pinController;
  late FocusNode _pinFocusNode;

  @override
  void initState() {
    super.initState();
    _pinFocusNode = FocusNode();
    _pinController = TextEditingController(); 
  }

  @override
  void dispose() {
    _pinFocusNode.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ConfirmAccountBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: BlocListener<ConfirmAccountBloc, ConfirmAccountState>(
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
                Fluttertoast.showToast(
                  msg: responseState.message ?? '',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.loginRoute,
                    (route) => false,
                  );
                });
              }
            },
            child: BlocBuilder<ConfirmAccountBloc, ConfirmAccountState>(
              builder: (context, state) {
                final responseState = state.response;
                if (responseState is Loading) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      ConfirmAccountContent(_bloc, state, pinController: _pinController, pinFocusNode: _pinFocusNode),
                      Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    ConfirmAccountContent(_bloc, state, pinController: _pinController, pinFocusNode: _pinFocusNode),
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
