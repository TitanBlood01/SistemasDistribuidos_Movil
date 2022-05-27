import 'package:flutter/material.dart';
import 'package:news/Provider/asignaciones_provider.dart';
import 'package:news/responsive.dart';
import 'package:news/screens/asignaciones/components/asignacion_post.dart';
import 'package:news/screens/asignaciones/components/asignaciones.dart';
import 'package:news/screens/asignaciones/components/formularioAsignacionParq.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AsignacionScreen extends StatelessWidget {
  const AsignacionScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height; 
    final asignacion = Provider.of<asignacionesProvider>(context, listen: true).indice;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,//Division de la pantalla 
          child: (asignacion==0) ? AsigancionPostCard()
          : FormularioAsignacioParq( 0.007,
                  0.04,
                  widthSize * 0.04,
                  0.06,
                  0.04,
                  0.07,
                  widthSize * 0.09,
                  0.05,
                  0.032,
                  0.04,
                  0.032)      
        ),
        /*SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Column(
              children: [
                Asignaciones(),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),*/
      ],
    );
  }
}
