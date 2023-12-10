import 'package:flutter/material.dart';
import 'package:flutter_flashcards/animations/fade_in_animation.dart';
import 'package:flutter_flashcards/configs/constants.dart';
import 'package:flutter_flashcards/databases/database_manager.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:flutter_flashcards/notifiers/review_notifier.dart';
import 'package:flutter_flashcards/pages/flashcards_page.dart';
import 'package:flutter_flashcards/pages/review_page.dart';
import 'package:flutter_flashcards/pages/settings_page.dart';
import 'package:provider/provider.dart';

import '../components/home_page/topic_tile.dart';
import '../data/words.dart';

class HomePage extends StatefulWidget {
  static const String id = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _topics = [];

  @override
  void initState() {
    super.initState();
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
      _topics.sort();
    }
    _topics.insertAll(0, []);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            )
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Settings icon
            _buildIcon(
                imagePath: 'assets/images/Settings.png',
                onTap: () => _navigateToSettingsPage(context),
                size: size
            ),
            const FadeInAnimation(
                child: Text(
                  'MyFlashcardsApp',
                  textAlign: TextAlign.center,
                )
            ),
            // Review icon
            _buildIcon(
                imagePath: 'assets/images/Review.png',
                onTap: () => _loadReviewPage(context),
                size: size
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                    padding: EdgeInsets.all(size.width * 0.10),
                    child: FadeInAnimation(
                        child: Image.asset('assets/images/MyFlashcards.png')
                    )
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        (context, index) => TopicTile(topic: _topics[index]),
                    childCount: _topics.length
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FlashcardsPage())
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _loadReviewPage(BuildContext context) {
    Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: 'Review');
    DatabaseManager().selectWords().then((words) {
      final reviewNotifier = Provider.of<ReviewNotifier>(context, listen: false);
      reviewNotifier.disableButtons(disable: words.isEmpty);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewPage()));
    });
  }

  void _navigateToSettingsPage(BuildContext context) {
    Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: 'Settings');
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  Widget _buildIcon({required String imagePath, required VoidCallback onTap, required Size size}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width * kIconPadding,
        child: Image.asset(imagePath),
      ),
    );
  }
}
