import 'dart:io';

// Importa módulos contendo perguntas específicas e funcionalidades de tempo.
import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'questions/math.dart';
import 'timing/waiting_timing.dart';

void main() async {
  // Inicializa variáveis e configurações principais.
  String kakoBot = 'KakoBOT:\n'; // Identificador para mensagens do bot.
  var a = true; // Controla o loop principal do bot.
  String usuario = ''; // Armazena a entrada do usuário.

  // Cria um stream para exibir o tempo de execução do bot.
  var myStream = BotClock().kakoBotStream(1, 10); // Stream que emite eventos a cada 1 segundo, por 10 segundos.
  var subscriber = myStream.listen((event) {
    // Listener para lidar com cada evento emitido pelo stream.
    print('                      KakoBot está ativo a: $event segundos');
  }, onDone: () {
    // Executado ao final da stream.
    print('KakoBot está sendo finalizado! Faça a última pergunta.');
    a = false; // Finaliza o loop principal.
  });

  // Mensagem inicial do bot.
  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock().clock(3); // Espera 3 segundos para simular carregamento.
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');

  // Loop principal para interagir com o usuário.
  do {
    usuario = stdin.readLineSync().toString(); // Lê a entrada do usuário.
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1); // Simula tempo de processamento.

    // Verifica se o usuário deseja encerrar a interação.
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false; // Finaliza o loop.
      print(kakoBot + ' Até a próxima!!');

    // Verifica se a pergunta está relacionada a tempo.
    } else if (TimeQuestions(usuario).isThisTime()) {
      // Antes de executar a ação, verifica se a pergunta é válida.
      TimeQuestions(usuario).timeQuestion(); // Responde a pergunta de tempo.
      await BotClock().clock(1); // Espera antes de continuar.

    // Verifica se a pergunta está relacionada a boas maneiras.
    } else if (MathQuestion(usuario).isMathFunc()) {
      MathQuestion(usuario).whatCanQuestion(); // Responde de acordo com boas maneiras.
      await BotClock().clock(2); // Espera antes de continuar.

    } else if (false) {
      // Basta adicionar novas verificações aqui.

    // Caso nenhuma das condições anteriores seja atendida.
    } else if (false) {
      // Basta adicionar novas verificações aqui.

    // Caso nenhuma das condições anteriores seja atendida.
    } else if (false) {
      // Basta adicionar novas verificações aqui.

    // Caso nenhuma das condições anteriores seja atendida.
    } else {
      await BotClock().clock(2); // Simula processamento mais longo.
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a); // Repete enquanto `a` for verdadeiro.

  // Mensagem final ao encerrar o bot.
  print('--Encerrando KakoBOT--');

}
