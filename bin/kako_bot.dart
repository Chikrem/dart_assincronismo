// Final aula-3


import 'dart:io';

import 'questions/time_questions.dart';
import 'timing/waiting_timing.dart';


void main() async{
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().kakoBotStream(1,10);   // Criando Stream

  var subscriber = myStream.listen((event) {      // Adicionando Listener / Subscriber
    print('                      KakoBot está ativo a: $event segundos');
  },onDone: (){
    print('KakoBot está sendo finalizado! Faça a ultima pergunta.');
    a = false;
  });

  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock().clock(3);
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
     await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
      await  BotClock().clock(1);
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    }else {
      await  BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}