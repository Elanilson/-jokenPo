import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha um opção abaixo";
  var _imagemJogo = AssetImage("imagens/padrao.png");

  void opcaoSelecionada (String escolhaUsuario){
    var  opcoes = ["pedra","papel","tesoura"];
    var  numero = Random().nextInt(3);
    var appEscolha = opcoes[numero];

    switch( appEscolha ){
      case "pedra":
        setState(() {
          this._imagemJogo = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemJogo = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemJogo = AssetImage("imagens/tesoura.png");
        });
        break;
    }
          //usuario ganhador
        if(
            (escolhaUsuario == "pedra" && appEscolha == "tesoura") ||
            ( escolhaUsuario == "tesoura" && appEscolha == "papel")||
            ( escolhaUsuario == "papel" && appEscolha == "pedra")
        ){
          setState(() {
            this._mensagem ="Parabéns!!! você ganhou! :D";
          });

        }else if (
            (appEscolha == "pedra" && escolhaUsuario == "tesoura") ||
            ( appEscolha == "tesoura" && escolhaUsuario == "papel")||
            ( appEscolha == "papel" && escolhaUsuario == "pedra")
        ){// app ganhador
          setState(() {
            this._mensagem ="você perdeu :/";
          });

        }else{// em pate
          setState(() {
            this._mensagem ="Empatamos ;)";
          });

        }




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top:32,bottom: 16),
          child: Text(
            "Escolha do app:",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          ),

           Image(image: this._imagemJogo,),
          Padding(padding: EdgeInsets.only(top:32,bottom: 16),
            child: Text(
              this._mensagem,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra") ,
                child:Image.asset("imagens/pedra.png",height: 100,),
              ),
              GestureDetector(
                  onTap: () => opcaoSelecionada("papel")  ,
                  child:Image.asset("imagens/papel.png",height: 100,),
              ),
              GestureDetector(
                  onTap: () => opcaoSelecionada("tesoura")  ,
                  child:Image.asset("imagens/tesoura.png",height: 100,),
              ),
              // Image.asset("imagens/pedra.png",height: 100,),
              // Image.asset("imagens/papel.png",height: 100,),
              // Image.asset("imagens/tesoura.png",height: 100,),
            ],
          )
        ],
      ),
    );
  }
}
