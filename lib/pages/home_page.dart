import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hussain_mustafa_riverpod/controllers/home_page_controller.dart';
import 'package:hussain_mustafa_riverpod/pages/page_data.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late HomePageController _homePageController;
  late HomePageData _homePageData;
  @override
  Widget build(BuildContext context) {
    _homePageController = ref.watch(homepagecontrollerProvider.notifier);
    _homePageData = ref.watch(homepagecontrollerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: _buildUI(
        context,
      ),
    );
  }

  _buildUI(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _allPokemonsList(
                context,
              )
            ],
          ),
        ),
      ),
    );
  }

  _allPokemonsList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          const Text(
            'All Pokemons',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.060,
            child: ListView.builder(
                itemCount: _homePageData.data?.results?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(index.toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
