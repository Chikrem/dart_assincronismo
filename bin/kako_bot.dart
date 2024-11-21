import 'dart:io'; // Importa a biblioteca para entrada e saída (I/O) padrão, usada para interagir com o terminal.
import 'questions/time_questions.dart'; // Importa o arquivo `time_questions.dart`, que contém funcionalidades relacionadas a perguntas sobre tempo.

// O tipo async no Dart é usado para escrever código assíncrono de maneira mais legível e 
// organizada. Ele permite que funções realizem operações demoradas, como leituras de 
// arquivos, requisições HTTP ou chamadas de banco de dados, sem bloquear a execução do 
// restante do programa.

void main() async {
  String kakoBot = 'KakoBOT:\n'; // Prefixo usado nas mensagens do bot.
  var a = true; // Variável de controle para manter o loop ativo enquanto o usuário não encerrar a interação.
  String usuario = ''; // Variável que armazenará a entrada do usuário.

  // Mensagem inicial ao iniciar o bot.
  print('-- Iniciando o KakoBOT, aguarde..--');

  print('KakoBOT:\n Oi :) \n Como posso ajudar?'); // Saída inicial do bot.
  do {
    // Lê a entrada do usuário.
    usuario = stdin.readLineSync().toString(); // Lê a linha digitada pelo usuário e converte para string.
    print('-- Processando pergunta, aguarde..--');

    // Verifica se o usuário deseja encerrar a interação.
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false; // Atualiza a variável de controle para encerrar o loop.
      print(kakoBot + ' Até a próxima!!'); // Mensagem de despedida.

    } 
    // Verifica se a pergunta está relacionada ao tempo usando a classe `TimeQuestions`.
    else if (TimeQuestions(usuario).isThisTime()) {
      // Se for uma pergunta sobre tempo, executa a lógica correspondente.
      TimeQuestions(usuario).timeQuestion();

    } 
    // Caso para novas perguntas (ainda não implementado).
    else if (false) {
      // Aqui você pode adicionar condições para tratar outras perguntas específicas.
    } 
    
    // Caso nenhuma das condições anteriores seja satisfeita.
    else {
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( '); // Mensagem de desculpas.
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus'); // Sugestão para o usuário.
    }
  } while (a); // Continua no loop enquanto `a` for verdadeiro.

  // Mensagem final ao encerrar o bot.
  print('--Encerrando KakoBOT--');
}
