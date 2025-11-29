part of '../import_package.dart';

class AIServices {

  static const String GEMINI_API_KEY = "Masukkan API Key Disini";
  late final GeminiProvider provider;

  AIServices() {
    provider = GeminiProvider(chatModel: GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: GEMINI_API_KEY,
      ));
  }

  Stream<String> generateText(String prompt) {
    try {
      return provider.sendMessageStream(prompt);
    } catch (e) {
      print("AI Service Error: $e");
      return Stream.value("Terjadi error saat menghubungi AI: ${e.toString()}");
    }
  }
}