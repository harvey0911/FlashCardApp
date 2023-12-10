import 'package:flutter/material.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({Key? key}) : super(key: key);

  @override
  State<AddFlashcardPage> createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  final _formKey = GlobalKey<FormState>();
  String _frontText = '';
  String _backText = '';

  void _submitFlashcard() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Add logic here to add the flashcard to the list
      Provider.of<FlashcardsNotifier>(context, listen: false).addFlashcard(_frontText, _backText);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Flashcard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Front Text'),
                validator: (value) => value!.isEmpty ? 'Please enter some text' : null,
                onSaved: (value) => _frontText = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Back Text'),
                validator: (value) => value!.isEmpty ? 'Please enter some text' : null,
                onSaved: (value) => _backText = value!,
              ),
              ElevatedButton(
                onPressed: _submitFlashcard,
                child: const Text('Add Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
