import 'dart:async';

void main() async {
  // Função geradora assíncrona que cria uma Stream.
//   Stream myStream(int interval, [int? maxCount]) async* {
//     int i = 1; // Inicia o contador em 1.
    
//     // Loop para gerar valores enquanto não atingir o maxCount.
//     while (i != maxCount) {
//       print("Counting: $i"); // Imprime o valor atual do contador.
      
//       // Pausa por "interval" segundos antes de gerar o próximo valor.
//       await Future.delayed(Duration(seconds: interval));
      
//       // Envia o valor atual do contador para os assinantes da Stream.
//       yield i++;
//     }
    
//     // Quando o loop termina, esta mensagem é exibida.
//     print('The myStream is finished');
//   }

//   // Cria uma Stream com intervalo de 1 segundo e máximo de 10 valores.
//   // Consumindo os eventos da Stream.
//  StreamSubscription mySubscriber = myStream(1,10).listen((event) {  // Uma Subscription em Dart é o objeto que representa a relação entre um listener e uma Stream. Quando você "escuta" (listen) uma Stream
//     if (event.isEven) {
//       print('This number is Even!');
//     }
//     },onError: (e) {
//       print('An error happend: $e');
//     },onDone: (){
//       print('The subscriber is gone.');
//     });

//   // Imprime imediatamente após a criação da Stream.
//   print('Main is finished');
  

// ########################################################################### //

// Criando uma Stream simples
Stream<int> numberStream(int maxCount) async* {
  for (int i = 1; i <= maxCount; i++) {
    await Future.delayed(Duration(seconds: 1)); // Delay de 1 segundo
    yield i; // Emite o número atual
  }
}

// Convertendo a Stream para broadcast
var instStream = numberStream(10).asBroadcastStream();

// Primeiro assinante
StreamSubscription<int> subscription1 = instStream.listen(
  (data) => print("Subscriber 1 received: $data"),
  onDone: () => print("Subscriber 1 is done"),
);

// Segundo assinante
StreamSubscription<int> subscription2 = instStream.listen(
  (data) => print("Subscriber 2 received: $data"),
  onDone: () => print("Subscriber 2 is done"),
);

// Pausando a assinatura 1 após 2 segundos
Future.delayed(Duration(seconds: 2), () {
  print("Pausing Subscriber 1");
  subscription1.pause();
});

// Retomando a assinatura 1 após 4 segundos
Future.delayed(Duration(seconds: 4), () {
  print("Resuming Subscriber 1");
  subscription1.resume();
});

// Cancelando a assinatura 2 após 6 segundos
Future.delayed(Duration(seconds: 6), () {
  print("Cancelling Subscriber 2");
  subscription2.cancel();
});

}
