import 'package:flutter/material.dart';
import 'package:news/Provider/login_web_state.dart';
import 'package:news/models/usuario.dart';
import 'package:news/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';

import 'Widgets/login_form.dart';

class DesktopMode extends StatefulWidget {
  @override
  _DesktopModeState createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height; 

    return Container(
      color: Color.fromRGBO(114, 47, 55, 1),
      child: Center(
        child: Container(
          height: heightSize * 0.75,
          width: widthSize * 0.65,
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('images/EstacionamientoInicio.png', height: 700, width: 650, semanticLabel: 'test'),
                    )
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    color: Color.fromRGBO(149, 47, 87, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/LogoWeb.png', height: heightSize * 0.2, width: widthSize * 0.15),
                        SizedBox(height: 20),
                        LoginForm(
                          0, 0.009, 16, 0.04, 0.01, 0.04,
                          75, 0.01, 0.007, 0.01, 0.006
                        )
                      ]
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }

}