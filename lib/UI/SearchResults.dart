import 'package:flutter/material.dart';
import 'package:formazione_flutter/Response/ArtistCollectionResponse.dart';
import 'package:formazione_flutter/UI/Common/TableContainerView.dart';

import '../Network/NetworkManager.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final _networkManager = NetworkManager();
  String searchText = "";

  void onQueryChanged(String text) {
    setState(() {
      searchText = text.replaceAll(" ", "+");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(onChanged: onQueryChanged),
        const SizedBox(height: 20),
        Expanded(
          child: FutureBuilder(
              future: _networkManager.getArtistCollection(searchText),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  ArtistCollectionResponse response = snapshot.data;
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: response.results?.length,
                      itemBuilder: (context, index) {
                        if (response.results?[index] != null) {
                          return TableContainerView(result: response.results![index]);
                        }
                        return null;
                      },
                    );
                  }
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                );
              }),
        )
      ],
    );
  }
}
