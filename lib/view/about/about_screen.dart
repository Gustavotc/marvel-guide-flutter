import 'package:flutter/material.dart';
import 'package:marvel_guide/view/about/widgets/avatar.dart';
import 'package:marvel_guide/view/about/widgets/developer_word_text.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o Projeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                const Avatar(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desenvolvido por:',
                        style: theme.bodySmall
                      ),
                      Text(
                        'Gustavo Travaini Chinalia',
                        style: theme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const DeveloperWordsText()
          ],
        ),
      ),
    );
  }
}
