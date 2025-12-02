import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:flutter/material.dart';

class CardProfileInfo extends StatelessWidget {
  User? user;
  CardProfileInfo(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.38,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35)
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListTile(
              title: Text('${user?.name ?? ''} ${user?.lastName ?? ''}'),
              subtitle: Text('Nombre de usuario'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text(user?.email ?? ''),
              subtitle: Text('Correo electronico'),
              leading: Icon(Icons.email),
            ),
            ListTile(
              title: Text(user?.phone ?? ''),
              subtitle: Text('Telefono'),
              leading: Icon(Icons.person),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  print('NAV: user -> $user');
                  Navigator.pushNamed(context, AppRouter.profileUpdateRoute, arguments: user);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}