import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formazione_flutter/Response/ArtistCollectionResponse.dart';

class TableContainerView extends StatelessWidget {
  final Results result;
  const TableContainerView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
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
                  TextSpan(text: artistName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan( text: ' - $albumName'),
                ],
              )
            )
          )
        ],
      ),
    );
  }
}
