import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  LoginBlocCubit? _loginBlocCubit;

  @override
  void initState() {
    super.initState();
    _loginBlocCubit = context.read<LoginBlocCubit>();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/img/background3.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, 0.7),
              colorBlendMode: BlendMode.darken,
            ),
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
                    const Icon(Icons.person, color: Colors.white, size: 125),
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder<String?>(
                        stream: _loginBlocCubit?.emailValidationStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Correo Electrónico',
                            icon: Icons.email,
                            errorText: snapshot.data,
                            onChanged: (text) =>
                                _loginBlocCubit?.changeEmail(text),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder<String?>(
                        stream: _loginBlocCubit?.passwordValidationStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Contraseña',
                            icon: Icons.lock,
                            errorText: snapshot.data,
                            onChanged: (text) =>
                                _loginBlocCubit?.changePassword(text),
                            obscureText: true,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      margin: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 25,
                        bottom: 15,
                      ),
                      child: StreamBuilder<bool>(
                        stream: _loginBlocCubit?.validateForm,
                        initialData: false,
                        builder: (context, snapshot) {
                          final bool isFormValid = snapshot.data ?? false;
                          return DefaultButton(
                            text: 'INICIAR SESIÓN',
                            color: isFormValid ? Colors.green : Colors.grey,
                            onPressed: () {
                              if (isFormValid) {
                                _loginBlocCubit?.login();
                              } else {
                                _loginBlocCubit?.login();
                                // Muestra el Toast de advertencia
                                Fluttertoast.showToast(
                                  msg: 'El formulario no es válido',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 53,
                          height: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(right: 5),
                        ),
                        Text(
                          'No tienes una cuenta?',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: 53,
                          height: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 5),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: DefaultButton(
                        text: 'REGISTRATE',
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, 'register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
