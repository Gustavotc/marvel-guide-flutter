import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/search_repository.dart';
import 'package:marvel_guide/view/home/widgets/hero_card.dart';
import 'package:marvel_guide/view/search/widgets/search_bar.dart';
import 'package:marvel_guide/view/widgets/heroes_list.dart';

import '../../controller/search_controller.dart';
import '../../model/hero_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<HeroModel> heroesResult = [];
  late SearchController controller;
  late ScrollController _scrollController;

  final loading = ValueNotifier(true);
  String searchValue = '';

  _fetchHero(String name) async {
    setState(() {
      searchValue = name;
    });
    loading.value = true;
    await controller.fetchHeroes(name);
    loading.value = false;
  }

  _handleInfiniteScrolling() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _fetchHero(searchValue);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = SearchController(repository: SearchRepository());
    _scrollController = controller.scrollController;
    controller.scrollController.addListener(_handleInfiniteScrolling);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Herói'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SearchBar(
              searchFn: _fetchHero,
            ),
            Expanded(
              child: HeroesList(
                animation: controller,
                scrollController: _scrollController,
                loading: loading,
                heroes: controller.heroes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
