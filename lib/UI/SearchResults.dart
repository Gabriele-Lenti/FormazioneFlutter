import 'package:flutter/material.dart';
import 'package:formazione_flutter/Response/ArtistCollectionResponse.dart';

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
    return Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              SearchBar(onChanged: onQueryChanged),
              const SizedBox(height: 20),
              FutureBuilder(
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
                            String artistName =
                                response.results?[index].artistName ?? "-";
                            String albumName =
                                response.results?[index].collectionName ?? "-";
                            String imageUrl = response.results?[index].artworkUrl100 ?? "";
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image.network(imageUrl),
                                  SizedBox(
                                      height: 100,
                                      width: 200,
                                      child: Text("$artistName - $albumName")
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }
                    return const CircularProgressIndicator();
                  })
            ],
          ),
        );
  }
}
