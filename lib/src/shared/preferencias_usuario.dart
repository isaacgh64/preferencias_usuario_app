import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _prefs = prefs;
  }

  //Ninguna de estas propiedades se usa
  //bool _colorSecundario;
  //bool _genero;
  //String _nombre;

  //GET Y SET DEL GENERO
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set sgenero(int value) {
    _prefs.setInt('genero', value);
  }

  //GET Y SET DEL _colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set sColorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //GET Y SET DEL nombreUsuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set snombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  //GET Y SET DE LA ÚLTIMA PÁGINA
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set sultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
