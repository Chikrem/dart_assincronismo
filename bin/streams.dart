import 'dart:async';

void main() {
  // Função geradora assíncrona que cria uma Stream.
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1; // Inicia o contador em 1.
    
    // Loop para gerar valores enquanto não atingir o maxCount.
    while (i != maxCount) {
      print("Counting: $i"); // Imprime o valor atual do contador.
      
      // Pausa por "interval" segundos antes de gerar o próximo valor.
      await Future.delayed(Duration(seconds: interval));
      
      // Envia o valor atual do contador para os assinantes da Stream.
      yield i++;
    }
    
    // Quando o loop termina, esta mensagem é exibida.
    print('The myStream is finished');
  }

  // Cria uma Stream com intervalo de 1 segundo e máximo de 10 valores.
  // Consumindo os eventos da Stream.
 StreamSubscription mySubscriber = myStream(1,10).listen((event) {  // Uma Subscription em Dart é o objeto que representa a relação entre um listener e uma Stream. Quando você "escuta" (listen) uma Stream
    if (event.isEven) {
      print('This number is Even!');
    }
    },onError: (e) {
      print('An error happend: $e');
    },onDone: (){
      print('The subscriber is gone.');
    });

  // Imprime imediatamente após a criação da Stream.
  print('Main is finished');
  

  // ########################################################################### //

//     // Criando uma Stream simples
//   Stream<int> numberStream(int maxCount) async* {
//     for (int i = 1; i <= maxCount; i++) {
//       await Future.delayed(Duration(seconds: 1)); // Delay de 1 segundo
//       yield i; // Emite o número atual
//     }
//   }

//   // Assinando a Stream
//   StreamSubscription<int> subscription = numberStream(5).listen(
//     (data) => print("Received: $data"), // Callback para dados
//     onError: (err) => print("Error: $err"), // Callback para erros
//     onDone: () => print("Stream is done"), // Callback para fim da Stream
//     cancelOnError: false, // Define se cancela automaticamente ao encontrar erro
//   );

//   // Pausando e retomando a Stream
//   Future.delayed(Duration(seconds: 2), () {
//     print("Pausing the stream");
//     subscription.pause(); // Pausa a assinatura
//   });

//   Future.delayed(Duration(seconds: 4), () {
//     print("Resuming the stream");
//     subscription.resume(); // Retoma a assinatura
//   });

//   // Cancelando a Stream antes de ela terminar
//   Future.delayed(Duration(seconds: 6), () {
//     print("Cancelling the stream");
//     subscription.cancel(); // Cancela a assinatura
//   });

}
