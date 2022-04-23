import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/comics_repository.dart';
import 'package:marvel_guide/view/home/widgets/comic_card.dart';
import 'package:marvel_guide/view/home/widgets/custom_progress_indicator.dart';

import '../../controller/comics_controller.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({Key? key}) : super(key: key);

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  late ComicsController controller;
  late ScrollController _scrollController;

  final loading = ValueNotifier(true);
  bool _noMoreResults = false;

  @override
  void initState() {
    super.initState();
    controller = ComicsController(repository: ComicsRepository());
    _fetchComics();
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(_handleInfiniteScrolling);
  }

  _fetchComics() async {
    if (!_noMoreResults) {
      loading.value = true;
      if (!await controller.fetchComics()) {
        const snackBar = SnackBar(
          content: Text('Não há mais resultados'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          _noMoreResults = true;
        });
      }
      loading.value = false;
    }
  }

  _handleInfiniteScrolling() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _fetchComics();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quadrinhos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  (controller.comics.isEmpty)
                      ? Container()
                      : GridView.builder(
                          controller: _scrollController,
                          itemCount: controller.comics.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 9 / 16,
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            final comic = controller.comics[index];
                            return ComicCard(
                                title: comic.title, imagePath: comic.imageUrl);
                          },
                        ),
                  CustomProgressIndicator(
                    loading: loading,
                  )
                ],
              );
            }),
      ),
    );
  }
}
