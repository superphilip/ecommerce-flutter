import 'package:flutter/material.dart';

selectOptionImageDialog(
  BuildContext context,
  Function() pickImage,
  Function() takePhoto,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selecciona una opción'),
        actions: [
          ElevatedButton(
            onPressed: () {
              pickImage();
              Navigator.of(context).pop();
            }, 
            child: Text(
              'Galeria',
              style: TextStyle(
                color: Colors.black),
            )
          ),
          ElevatedButton(
            onPressed: () {
              takePhoto();
              Navigator.of(context).pop();
            }, 
            child: Text(
              'Camara',
              style: TextStyle(
                color: Colors.black),
            )
          ),
        ],
      );
    },
  );
}
