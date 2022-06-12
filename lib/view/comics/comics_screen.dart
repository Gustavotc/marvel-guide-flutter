import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/comics_repository.dart';
import 'package:marvel_guide/store/favorites_store.dart';
import 'package:marvel_guide/view/comics/widgets/shimmer_comics_list.dart';
import 'package:marvel_guide/view/favoritesList/favorites_list.dart';
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

  final isLoading = ValueNotifier(true);
  bool _isFirstLoading = true;
  bool _noMoreResults = false;
  bool _isFavorites = false;

  @override
  void initState() {
    super.initState();
    controller = ComicsController(repository: ComicsRepository());
    _fetchComics();
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(_handleInfiniteScrolling);
    controller.favorites = FavoritesStore.instance.favorites?.comics;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  _fetchComics() async {
    if (!_noMoreResults) {
      isLoading.value = true;
      if (!await controller.fetchComics()) {
        const snackBar = SnackBar(
          content: Text('Não há mais resultados'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          _noMoreResults = true;
        });
      }
      isLoading.value = false;

      if (_isFirstLoading) {
        setState(() {
          _isFirstLoading = false;
        });
      }
    }
  }

  _handleInfiniteScrolling() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _fetchComics();
    }
  }

  _handleFavoritesPress() {
    setState(() {
      _isFavorites = !_isFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quadrinhos'),
        actions: [
          IconButton(
            onPressed: _handleFavoritesPress,
            icon: Icon(
              _isFavorites ? Icons.favorite : Icons.favorite_border_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  _isFavorites
                      ? FavoritesList(
                          favoritesId: controller.favorites ?? [],
                          isHero: false,
                        )
                      : _isFirstLoading
                          ? const ShimmerCommicsList()
                          : (controller.comics.isEmpty)
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
                                      comic: comic,
                                    );
                                  },
                                ),
                  CustomProgressIndicator(
                    loading: isLoading,
                  )
                ],
              );
            }),
      ),
    );
  }
}
