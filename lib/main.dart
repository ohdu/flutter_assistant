import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal assistant',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(title: 'Personal assistant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ChatMessage> _message = [];

  final ChatGPTApi _api = ChatGPTApi(sessionToken: "", clearanceToken: "");

  void _incrementCounter() {
    setState(() {
      _message
          .add(ChatMessage(text: "你好啊", chatMessageType: ChatMessageType.bot));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    _message[index].text,
                    style: const TextStyle(color: Colors.blue, fontSize: 16),
                  );
                },
                itemCount: _message.length,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              child: _buildTextComposer(),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            )
          ],
        ));
  }

  final TextEditingController _textController = TextEditingController();
  Widget _buildTextComposer() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              // onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => {} //_handleSubmitted(_textController.text),
                ),
          ),
        ],
      ),
    );
  }
}
