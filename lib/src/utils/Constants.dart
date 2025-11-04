import 'package:flutter/services.dart';


const String kTextVacio = 'El campo no puede estar vacío';
const String kMinLengthError = 'El campo debe tener al menos 2 caracteres.';
const String kPasswordFormatError = 
'''La contraseña: 
  -debe tener al menos 8 caracteres''';
const String kPasswordFormatError2 =
    '''La contraseña debe ser segura: 
    - Debe tener al menos una mayúscula. 
    - Debe tener al menos una minúscula. 
    - Debe tener al menos un número.
    - Debe tener al menos un carácter 
      especial.''';
const String kPasswordMismatchError = 'Las contraseñas no coinciden.';
const String kPhoneLengthError = 'El número de teléfono debe tener al menos 8 dígitos.';
const String kEmailFormatError = 'El correo no es válido.';

/// Permite solo letras (mayúsculas, minúsculas), espacios, y
/// caracteres comunes en español (acentos, ñ, etc.).
final FilteringTextInputFormatter
kOnlyAlphabeticFormatter = FilteringTextInputFormatter.allow(
  // Expresión Regular para letras, espacios y caracteres especiales de idiomas latinos.
  RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"),
);

/// permite emails válidos.
/// Basado en el estándar RFC 5322 para direcciones de correo electrónico.
final RegExp kEmailRegExp = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);

/// formato de las contraseñas: al menos 8 caracteres, una mayúscula,
/// una minúscula, un número y un carácter especial.
/// Basado en las recomendaciones comunes de seguridad.
final RegExp kPasswordRegExp = RegExp(
  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
);

/// permite solo números (dígitos).
/// Útil para campos como teléfono, edad, etc.
/// Basado en dígitos del 0 al 9.
final FilteringTextInputFormatter kOnlyNumericFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'));

