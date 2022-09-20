import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final textController = TextEditingController();
  List<String> messages = ['첫번째 메세지', '두번째 메세지'];
  String _tempMessage = '첫번째 메세지';
  String _getMessage(int index) => messages[index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('한줄 메모'),
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _tempMessage = messages[index-1];
                    messages[index-1] = messages[index];
                    messages[index] = _tempMessage;
                  });
                },
                child: const Icon(Icons.arrow_upward),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    messages.removeAt(index);
                  });
                },
                child: const Icon(Icons.remove)
              ),
              title: Text(_getMessage(index))
            );
          }
        ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.1,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  icon: Icon(CupertinoIcons.pen),
                  hintText: '메세지를 입력하세요',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 6),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  messages.add(textController.text);
                });
                textController.clear();
              },
              child: const Text('추가'),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
