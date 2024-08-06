import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/Response/artist_collection_response.dart';
import 'package:formazione_flutter/UI/DetailPageWidget/detail_page_widget.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_events.dart';

import '../FavouritesWidget/PreferitiBloc/preferiti_state.dart';

class TableContainerView extends StatelessWidget {
  final Results result;
  const TableContainerView({super.key, required this.result});

  void addOrRemoveFavorite(BuildContext context, String id, Results object) {
    context.read<PreferitiBloc>().add(AddOrRemovePreferitiEvent(id, object));
  }

  bool isFavorite(PreferitiState state, String id) {
    return state.preferiti.contains(id);
  }

  @override
  Widget build(BuildContext context) {
    String trackId = result.artistId == null
        ? (result.trackId.toString() + result.collectionId.toString())
        : (result.artistId.toString() + result.trackId.toString());
    String artistName = result.collectionArtistName ?? result.artistName ?? "";
    String albumName = result.trackName ?? result.collectionName ?? "";
    String imageUrl = result.artworkUrl100 ?? "";

    return BlocBuilder<PreferitiBloc, PreferitiState>(
        builder: (BuildContext context, PreferitiState state) {
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPageWidget(track: result),
              ),
            );
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.white54,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.assetNetwork(
                        placeholder:
                            'lib/assets/placeholder.jpg', // può essere anche .gif
                        image: imageUrl,
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.fill,
                      ),
                    ),
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
                      addOrRemoveFavorite(context, trackId, result);
                    },
                    child: isFavorite(state, trackId)
                        ? const Icon(Icons.favorite, color: Colors.deepPurple)
                        : const Icon(Icons.favorite_border_outlined,
                            color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
