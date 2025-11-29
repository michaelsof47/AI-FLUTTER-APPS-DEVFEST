
part of '../import_package.dart';

class AiChatController extends GetxController {
  final aiServices = Get.put(AIServices());
  final responseText = "".obs;


  void sendMessages(String prompt) {
    responseText.value = "";

    final stream = aiServices.generateText(prompt);

    stream.listen(
      (chunk) {
        responseText.value += chunk;
      },
      onError: (error) {
        responseText.value = "Terjadi error saat menghubungi AI: ${error.toString()}";
      }
    );
  }

}