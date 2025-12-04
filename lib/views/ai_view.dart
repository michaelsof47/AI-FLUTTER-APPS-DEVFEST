part of '../import_package.dart';

class AIView extends StatefulWidget {
  const AIView({Key? key}) : super(key: key);

  @override
  State<AIView> createState() => _AIViewState();
}

class _AIViewState extends State<AIView> {

  AiChatController? aiChatController;
  TextEditingController? inputController;

  @override
  void initState() {
    super.initState();
    aiChatController = Get.put(AiChatController());
    inputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat")),
      body: Column(
        children: [
          // Display response
          Expanded(
            child: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(aiChatController!.responseText.value),
              ),
            )),
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final prompt = inputController!.text;
                    if (prompt.isNotEmpty) {
                      aiChatController!.sendMessages(prompt); // Panggil di sini
                      inputController!.clear();
                    }
                  },
                ),
              ]
            ),
          )
        ],
      )
    );
  }
}