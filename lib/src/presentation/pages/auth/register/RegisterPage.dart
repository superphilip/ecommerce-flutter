import 'package:ecommerce_flutter/src/utils/Constants.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? _registerBlocCubit;

  @override
  void initState() {
    super.initState();
    _registerBlocCubit = context.read<RegisterBlocCubit>();
    
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
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 100),
                    Text(
                      'REGISTRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder<String?>(
                        stream: _registerBlocCubit?.nameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Nombre',
                            icon: Icons.person,
                            onChanged: (text) {
                              _registerBlocCubit?.changeName(text);
                            },
                            errorText: snapshot.data,
                            formatter: kOnlyAlphabeticFormatter,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.lastNameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Apellido',
                            icon: Icons.person,
                            onChanged: (text) {
                              _registerBlocCubit?.changeLastName(text);
                            },
                            errorText: snapshot.data,
                            formatter: kOnlyAlphabeticFormatter,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.emailStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Email',
                            icon: Icons.email,
                            onChanged: (text) {
                              _registerBlocCubit?.changeEmail(text);
                            },
                            errorText: snapshot.data,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.phoneStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Telefono',
                            icon: Icons.phone,
                            onChanged: (text) {
                              _registerBlocCubit?.changePhone(text);
                            },
                            errorText: snapshot.data,
                            formatter: kOnlyNumericFormatter,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.passwordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Contraseña',
                            icon: Icons.lock,
                            onChanged: (text) {
                              _registerBlocCubit?.changePassword(text);
                            },
                            obscureText: true,
                            errorText: snapshot.data,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.confirmPasswordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Confirmar Contraseña',
                            icon: Icons.lock_outline,
                            onChanged: (text) {
                              _registerBlocCubit?.changeConfirmPassword(text);
                            },
                            obscureText: true,
                            errorText: snapshot.data,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.validateForm,
                        builder: (context, snapshot) {
                          final bool isFormValid = snapshot.data ?? false;
                          return DefaultButton(
                            text: 'REGISTRARSE',
                            color: isFormValid ? Colors.black : Colors.grey,
                            onPressed: () {
                              isFormValid
                                  ? _registerBlocCubit?.register()
                                  : _registerBlocCubit?.register();
                              Fluttertoast.showToast(
                                msg: 'El formulario no es válido',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultIconBack(
              left: 45, 
              top: 150,
              onPressed: () =>Navigator.pushReplacementNamed(context, 'login')
            ),
          ],
        ),
      ),
    );
  }
}
