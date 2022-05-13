import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  final String _nombre = 'Pedro';
  TextEditingController? _textController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.sultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int? valor) {
    setState(() {
      prefs.sgenero = valor!;
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
          title: const Text('Ajustes'),
        ),
        drawer: const MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: const Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.sColorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: const Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: const Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona que usa el teléfono',
                ),
                onChanged: (value) {
                  prefs.snombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
