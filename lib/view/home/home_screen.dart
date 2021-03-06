import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/home_controller.dart';
import 'package:marvel_guide/repository/home_repository.dart';
import 'package:marvel_guide/route/route.dart' as route;
import 'package:marvel_guide/store/favorites_store.dart';
import 'package:marvel_guide/view/favoritesList/favorites_list.dart';
import 'package:marvel_guide/view/home/widgets/shimmer_heroes_list.dart';
import 'package:marvel_guide/view/home/widgets/user_header.dart';
import 'package:marvel_guide/view/widgets/heroes_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  late ScrollController _scrollController;

  final isLoading = ValueNotifier(true);
  bool isFirstLoading = true;
  String _username = '';
  bool _noMoreResults = false;
  bool isFavorites = false;

  _fetchUsername() async {
    String name = await controller.getUserName();
    setState(() {
      _username = name;
    });
  }

  _handleLogout() async {
    if (await controller.logout()) {
      Navigator.pushReplacementNamed(context, route.login);
    }
  }

  _fetchHeroes() async {
    if (!_noMoreResults) {
      isLoading.value = true;
      if (!await controller.fetchHeroes()) {
        const snackBar = SnackBar(
          content: Text('Não há mais resultados'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          _noMoreResults = true;
        });
      }
      isLoading.value = false;

      if (isFirstLoading) {
        setState(() {
          isFirstLoading = false;
        });
      }
    }
  }

  _handleInfiniteScrolling() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _fetchHeroes();
    }
  }

  _handleFavoritesPress() {
    setState(() {
      isFavorites = !isFavorites;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(repository: HomeRepository());
    _fetchUsername();
    _fetchHeroes();
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(_handleInfiniteScrolling);
    controller.favoriteHeroesId = FavoritesStore.instance.favorites?.heroes;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis'),
        actions: [
          IconButton(
            onPressed: _handleFavoritesPress,
            icon: Icon(
              isFavorites ? Icons.favorite : Icons.favorite_border_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UserHeader(
              username: _username,
              logout: _showLogoutAlert,
            ),
            isFirstLoading
                ? const ShimmerHeroesList()
                : isFavorites
                    ? FavoritesList(
                        favoritesId: controller.favoriteHeroesId ?? [],
                      )
                    : Flexible(
                        child: HeroesList(
                          animation: controller,
                          scrollController: _scrollController,
                          loading: isLoading,
                          heroes: controller.heroes,
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  _showLogoutAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirmar logout'),
        content: const Text('Deseja finalizar a sessão atual?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: _handleLogout,
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
