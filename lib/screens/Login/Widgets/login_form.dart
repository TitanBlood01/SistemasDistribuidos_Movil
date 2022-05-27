import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:news/Provider/login_web_state.dart';
import 'package:news/models/usuario.dart';
import 'package:news/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  final paddingTopForm,
      fontSizeTextField,
      fontSizeTextFormField,
      spaceBetweenFields,
      iconFormSize;
  final spaceBetweenFieldAndButton,
      widthButton,
      fontSizeButton,
      fontSizeForgotPassword,
      fontSizeSnackBar,
      errorFormMessage;

  LoginForm(
      this.paddingTopForm,
      this.fontSizeTextField,
      this.fontSizeTextFormField,
      this.spaceBetweenFields,
      this.iconFormSize,
      this.spaceBetweenFieldAndButton,
      this.widthButton,
      this.fontSizeButton,
      this.fontSizeForgotPassword,
      this.fontSizeSnackBar,
      this.errorFormMessage);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<Usuario> usuarios = [];
  bool _isLoading = false;
  String nicknameUsuario;
  String pinUsuario;
  String nombreUsuario;
  final _formKey = GlobalKey<FormState>();

  final _nicknameController = TextEditingController();
  final _nombreController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  signIn(BuildContext context, String nickname, String pin, String nombre) async {
    final _userLogged = Provider.of<LoginState>(context, listen: false);
    Map data = {'nickName': nickname, 'pin': pin, 'nombre': nombre};
    var jsonResponse = null;
    var url = Uri.parse('http://192.168.0.20:3000/signin');
    var response = await http.post(url, body: data);
    print(response.body);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        _userLogged.logeado = true;
      } else {
        _userLogged.logeado = false;
        print(response.body);
      }
    }
    print('Hola');
  }

  @override
  Widget build(BuildContext context) {
    final _userLogged = Provider.of<LoginState>(context, listen: false);
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
            left: widthSize * 0.05,
            right: widthSize * 0.05,
            top: heightSize * widget.paddingTopForm),
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nickname',
              style: TextStyle(
                  fontSize: widthSize * widget.fontSizeTextField,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ),
          TextFormField(
            controller: _nicknameController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Digita tu cuenta para ingresar al Sistema!';
              }
            },
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.white),
              errorStyle: TextStyle(
                  color: Colors.white,
                  fontSize: widthSize * widget.errorFormMessage),
              prefixIcon: Icon(
                Icons.person,
                size: widthSize * widget.iconFormSize,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontSize: widget.fontSizeTextFormField),
            onChanged: (value) {
              setState(() {
                nicknameUsuario = value;
              });
            },
          ),
          SizedBox(height: heightSize * widget.spaceBetweenFields),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pin',
              style: TextStyle(
                  fontSize: widthSize * widget.fontSizeTextField,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ),
          TextFormField(
            controller: _pinController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Introduzca su PIN de Usuario para ingresar!';
              }
            },
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.white),
              errorStyle: TextStyle(
                  color: Colors.white,
                  fontSize: widthSize * widget.errorFormMessage),
              prefixIcon: Icon(
                Icons.lock,
                size: widthSize * widget.iconFormSize,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontSize: widget.fontSizeTextFormField),
            onChanged: (value) {
              setState(() {
                pinUsuario = value;
              });
            },
          ),
          SizedBox(height: heightSize * widget.spaceBetweenFields),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nombre',
              style: TextStyle(
                  fontSize: widthSize * widget.fontSizeTextField,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ),
          TextFormField(
            controller: _nombreController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Introduzca su Nombre de Usuario para ingresar!';
              }
            },
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            //obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.white),
              errorStyle: TextStyle(
                  color: Colors.white,
                  fontSize: widthSize * widget.errorFormMessage),
              prefixIcon: Icon(
                Icons.lock,
                size: widthSize * widget.iconFormSize,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontSize: widget.fontSizeTextFormField),
            onChanged: (value) {
              setState(() {
                nombreUsuario = value;
              });
            },
          ),
          SizedBox(height: heightSize * widget.spaceBetweenFieldAndButton),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.fromLTRB(
                widget.widthButton, 15, widget.widthButton, 15),
            color: Colors.white,
            onPressed: _nicknameController.text == "" ||
                    _pinController.text == "" ||
                    _nombreController == ""
                ? null
                : () {
                    signIn(context, _nicknameController.text, 
                    _pinController.text, _nombreController.text );
                  },
            child: Text(
              'ENTRAR',
              style: TextStyle(
                  fontSize: widthSize * widget.fontSizeButton,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(41, 187, 255, 1)),
            ),
          ),
          SizedBox(height: heightSize * 0.01),
          Text('Bienvenido a la aplicacion de asignacion de parqueos!',
              style: TextStyle(
                  fontSize: widthSize * widget.fontSizeForgotPassword,
                  fontFamily: 'Poppins',
                  color: Colors.white)),
        ]),
      ),
    );
  }
}

class Estatica {
  static String valor = "";
}
