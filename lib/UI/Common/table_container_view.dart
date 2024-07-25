import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formazione_flutter/Provider/favorites_provider.dart';
import 'package:formazione_flutter/Response/artist_collection_response.dart';
import 'package:provider/provider.dart';

class TableContainerView extends StatelessWidget {
  final Results result;
  final VoidCallback callback;

  const TableContainerView(
      {super.key, required this.result, required this.callback});

  @override
  Widget build(BuildContext context) {

    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    String trackId = result.artistId == null ? result.trackId.toString() : result.artistId.toString();
    String artistName = result.collectionArtistName ?? result.artistName ?? "";
    String albumName = result.trackName ?? "-";
    String imageUrl = result.artworkUrl100 ?? "";

    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: artistName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' - $albumName'),
            ],
          ))),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: TextButton(
              onPressed: () {
                favoritesProvider.addOrRemoveFavorite(trackId);
              },
              child: favoritesProvider.isElementInFavorite(trackId) ? const Icon(
                  Icons.favorite,
                  color: Colors.deepPurple
              ) : const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.deepPurple
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
