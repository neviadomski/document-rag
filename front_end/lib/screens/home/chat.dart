import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class MainChat extends StatefulWidget {
  const MainChat({super.key});

  @override
  State<MainChat> createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  final List<types.Message> _messages = [];
  final Map<String, types.User> _users = {
    'chat': types.User(id: 'chat', firstName: 'LLM Agent'),
    'system': types.User(id: 'system', firstName: 'Notifications'),
    'user':
        types.User(id: uuid.v4(), firstName: 'Sergei', lastName: 'Nevedomski'),
  };

  @override
  Widget build(BuildContext context) => Chat(
        messages: _messages,
        onAttachmentPressed: _handleFileSelection,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        user: _users['user']!,
        showUserAvatars: true,
        showUserNames: true,
      );

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Please select a pdf file',
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Persist file and return the uri
      final String pdfUri = "assets/PNC 2023 Annual Report.pdf";

      final fileMessage = types.FileMessage(
        author: _users['user']!,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: uuid.v4(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: pdfUri,
      );

      _addMessage(fileMessage);

      final textMessage = types.TextMessage(
        author: _users['system']!,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: uuid.v4(),
        text:
            "PDF File '${fileMessage.name}' uploaded. Agentic RAG can answer questions about this document.",
      );

      _addMessage(textMessage);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _users['user']!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: uuid.v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    final textChatMessage = types.TextMessage(
      author: _users['chat']!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: uuid.v4(),
      text: "REALLY!!!  Not the best question. Try harder.",
    );

    _addMessage(textChatMessage);
  }
}
