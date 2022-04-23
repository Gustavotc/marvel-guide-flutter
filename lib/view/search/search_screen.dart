import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/search_repository.dart';
import 'package:marvel_guide/view/home/widgets/shimmer_heroes_list.dart';
import 'package:marvel_guide/view/search/widgets/search_bar.dart';
import 'package:marvel_guide/view/widgets/heroes_list.dart';

import '../../controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchController controller;
  late ScrollController _scrollController;

  final _isLoading = ValueNotifier(false);
  String searchValue = '';
  bool _noMoreResults = false;
  bool _showShimmerLoading = false;
  bool _noResults = false;

  _fetchHero(String name) async {
    if (searchValue != name) {
      searchValue = name;
      controller.resetSearch();
      _noMoreResults = false;
      setState(() {
        _showShimmerLoading = true;
        _noResults = false;
      });
    }

    if (!_noMoreResults && searchValue.isNotEmpty) {
      _isLoading.value = true;

      if (!await controller.fetchHeroes(name) && controller.heroes.isNotEmpty) {
        const snackBar = SnackBar(
          content: Text('Não há mais resultados'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _noMoreResults = true;
      }

      if (controller.heroes.isEmpty) {
        setState(() {
          _noResults = true;
        });
        print('SEM RESULTADOS');
      }
    }
    _isLoading.value = false;
    setState(() {
      _showShimmerLoading = false;
    });
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
            _noResults
                ? const Expanded(child: Center(child: Text('Sem resultados')))
                : _showShimmerLoading
                    ? const ShimmerHeroesList()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: HeroesList(
                            animation: controller,
                            scrollController: _scrollController,
                            loading: _isLoading,
                            heroes: controller.heroes,
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
