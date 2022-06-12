import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/favorites_list_controller.dart';
import 'package:marvel_guide/view/home/widgets/comic_card.dart';
import 'package:marvel_guide/view/widgets/heroes_list.dart';

class FavoritesList extends StatefulWidget {
  final bool isHero;
  final List<int> favoritesId;

  const FavoritesList({
    Key? key,
    required this.favoritesId,
    this.isHero = true,
  }) : super(key: key);

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  late FavoritesListController controller;
  final isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    controller = FavoritesListController();
    controller.isHero = widget.isHero;
    _fetchFavorites();
  }

  _fetchFavorites() async {
    isLoading.value = true;
    await controller.fetchFavorites();
    isLoading.value = false;
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoritesId.isNotEmpty
        ? widget.isHero
            ? Flexible(
                child: HeroesList(
                  animation: controller,
                  scrollController: controller.scrollController,
                  loading: isLoading,
                  heroes: controller.heroes,
                ),
              )
            : GridView.builder(
                controller: controller.scrollController,
                itemCount: controller.comics.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              )
        : Expanded(
            child: Center(
              child: Text(
                'Adicione itens aos favoritos para que eles apareçam aqui!',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
