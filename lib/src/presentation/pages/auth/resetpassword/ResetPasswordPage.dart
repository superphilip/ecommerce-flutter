import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/ResetPasswordContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/bloc/ResetPasswordBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? notificationToken;
  const ResetPasswordPage({super.key, this.notificationToken});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  ResetPasswordBloc? _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc = BlocProvider.of<ResetPasswordBloc>(context);
      final token = widget.notificationToken?.trim();

      print('ResetPasswordPage - postFrame token: "$token"');

      if (token != null && token.isNotEmpty) {
        _bloc!.add(ResetPasswordSetNotificationToken(notificationToken: token));
      } else {
        final args = ModalRoute.of(context)?.settings.arguments;
        if (args is String && args.trim().isNotEmpty) {
          _bloc!.add(
            ResetPasswordSetNotificationToken(notificationToken: args.trim()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ResetPasswordBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
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
                print(widget.notificationToken);
                _bloc?.add(ResetPasswordReset());
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
            child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
              builder: (context, state) {
                final responseState = state.response;
                if (responseState is Loading) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      ResetPasswordContent(_bloc, state, _formKey),
                      Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [ResetPasswordContent(_bloc, state, _formKey)],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
