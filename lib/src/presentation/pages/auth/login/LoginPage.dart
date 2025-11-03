import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/img/background3.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 125,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Correo Electrónico', 
                      icon: Icons.email, 
                      onChanged: (text) {}
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Contraseña', 
                      icon: Icons.lock, 
                      onChanged: (text) {},
                      obscureText: true,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                    child: 
                    DefaultButton(
                      text: 'INICIAR SESIÓN',
                      color: Colors.green, 
                      onPressed: () {}
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 53, height: 1, color: Colors.white, margin: EdgeInsets.only(right: 5)),
                      Text(
                        'No tienes una cuenta?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(width: 53, height: 1, color: Colors.white, margin: EdgeInsets.only(left: 5)),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: 
                    DefaultButton(
                      text: 'REGISTRATE', 
                      onPressed: () => Navigator.pushNamed(context, 'register')
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}