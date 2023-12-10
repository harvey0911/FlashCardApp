import 'package:flutter/material.dart';
import 'package:flutter_flashcards/pages/add_flashcard_page.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddFlashcardPage()),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.blueGrey[100],
          ),
          child: const Center(
            child: Icon(Icons.add, size: 64, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
