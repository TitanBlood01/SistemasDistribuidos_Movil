import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/Provider/asignaciones_provider.dart';
import 'package:news/responsive.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AsigancionPostCard extends StatelessWidget {
  const AsigancionPostCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asignacion = Provider.of<asignacionesProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Reservaciones".toUpperCase(),
                      style: TextStyle(
                        color: kDarkBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      'Formulario de Reservacion de Parqueo',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    'Aqui podra realizar la reservacion de un Espacio de Parqueo Disponible',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'Por favor haga click en el boton que se muestra en la parte inferior para acceder al formulario de reserva de parqueo, no olvide llenar el formulario con todos sus datos, especificando la hora de entrada y la hora de salida',
                  maxLines: 5,
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.only(bottom: kDefaultPadding / 4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: kPrimaryColor, width: 3),
                          ),
                        ),
                        child: Text(
                          "Read More",
                          style: TextStyle(color: kDarkBlackColor),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(
                          "assets/icons/feather_thumbs-up.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                          "assets/icons/feather_message-square.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          SvgPicture.asset("assets/icons/feather_share-2.svg"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),  
          ),
          SizedBox(height: 15),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              asignacion.setIndice= 1;
            },
            color: Colors.red, 
            child: Text(
              'RESERVAR',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(255, 255, 255, 1)),
            ),)
        ],
      ),
    );
  }
}
