import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EthelColors {
  static const brand = Color(0xff615EF0);
  static const infoSmall = Color(0xff8D9096);
  static const mainBackground = Color(0xfffafafa);
  static const unselected = Color(0xffC5C7CB);
  static const selected = Color(0xff2A64D9);
  static const expenseBlue = Color(0xff2758ED);
  static const buttonsColor = Color(0xffFF405C);
  static const hof = Color(0xff484848);
}

String license_1 =
    "Este programa es software libre; puede redistribuirlo y/o modificarlo bajo los términos de la Licencia Pública General GNU tal como está publicada por la Fundación para el Software Libre; ya sea la versión 2 de la licencia, o (a su elección) cualquier versión posterior";

String license_2 =
    "Este programa se distribuye con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA; ni siquiera la garantía implícita de COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Consulte la Licencia Pública General de GNU para obtener más detalles.";

String ethelBasic =
    "${dotenv.env['API_URL']}v1/ethel-ia/basic/procesar-consulta";

String ethelFull = "${dotenv.env['API_URL']}v1/ethel-ia/full/procesar-consulta";

String question1 = "¿Quién es el Presidente de El Salvador?";
String question2 = "Dame el código para crear una función asíncrona en NodeJS.";
String question3 = "¿En qué año se independizó El Salvador?";
String question4 = "¿De qué están hechos los hot dogs?";
