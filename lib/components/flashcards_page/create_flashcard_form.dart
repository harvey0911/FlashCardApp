import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateFlashcardForm extends StatefulWidget {
  @override
  _CreateFlashcardFormState createState() => _CreateFlashcardFormState();
}

class _CreateFlashcardFormState extends State<CreateFlashcardForm> {
  final _formKey = GlobalKey<FormState>();
  String _word = '';
  String _imageURL = '';

  Future<void> _saveFlashcard() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? flashcards = prefs.getStringList('flashcards');

    final newFlashcard = '$_word,$_imageURL';
    if (flashcards == null) {
      flashcards = [newFlashcard];
    } else {
      flashcards.add(newFlashcard);
    }

    await prefs.setStringList('flashcards', flashcards);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _saveFlashcard().then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Word'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a word';
                  }
                  return null;
                },
                onSaved: (value) => _word = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
                onSaved: (value) => _imageURL = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Create Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
