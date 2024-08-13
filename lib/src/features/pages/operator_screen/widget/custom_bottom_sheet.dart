import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder:
          (BuildContext context, ChatProvider chatProider, Widget? child) =>
              SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Select message',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatProider.readyMessages.length,
                  itemBuilder: (context, index) {
                    final message = chatProider.readyMessages[index];
                    return ListTile(
                      title: Text(message),
                      onTap: () {
                        chatProider.setMessage(message);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 42/operator,["operator_message",{"image":"/static/uploads/image/7a/72/7a72696a09b74177a4f1f8d11f75b8e8.png","hash":"7a72696a09b74177a4f1f8d11f75b8e8.png","title":"Снимок экрана 2024-06-27 в 12.09.08.png","url":"/static/uploads/image/7a/72/7a72696a09b74177a4f1f8d11f75b8e8.png","response_id":0,"chat":"58e0ea2bc6f14dbf87efa62d4e408d68"}]	

// curl 'https://inqbox.q19.kz/upload/' \
//   -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryr8tbEKpbBl6aJ3SJ' \
//   --data-raw $'------WebKitFormBoundaryr8tbEKpbBl6aJ3SJ\r\nContent-Disposition: form-data; name="type"\r\n\r\nimage\r\n------WebKitFormBoundaryr8tbEKpbBl6aJ3SJ\r\nContent-Disposition: form-data; name="file"; filename="Снимок экрана 2024-06-27 в 12.09.08.png"\r\nContent-Type: image/png\r\n\r\n\r\n------WebKitFormBoundaryr8tbEKpbBl6aJ3SJ--\r\n'


// {hash: "27776ecf7df2407e90c1570d12951ec7.png", title: "Снимок экрана 2024-06-27 в 12.09.08.png",…}
// hash
// : 
// "27776ecf7df2407e90c1570d12951ec7.png"
// title
// : 
// "Снимок экрана 2024-06-27 в 12.09.08.png"
// url
// : 
// "/static/uploads/image/27/77/27776ecf7df2407e90c1570d12951ec7.png"