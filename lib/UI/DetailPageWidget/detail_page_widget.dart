import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formazione_flutter/Response/artist_collection_response.dart';

class DetailPageWidget extends StatelessWidget {
  final Results track;

  const DetailPageWidget({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    DateTime releaseDate = DateTime.parse(track.releaseDate ?? "");
    Duration duration = Duration(
        milliseconds:
            track.trackTimeMillis ?? 0); // differenziare se film o canzone

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
        elevation: 5,
      ),
      body: Expanded(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: ImageFiltered(
                imageFilter: ImageFilter.erode(radiusX: -2, radiusY: -2),
                child: FadeInImage.assetNetwork(
                  fadeOutDuration: Duration(milliseconds: 150),
                  placeholder: 'lib/assets/detail-placeholder.png',
                  image: track.artworkUrl100?.replaceAll("100", "100") ?? "",
                  height: 540.0,
                  width: 900.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(color: Colors.black.withAlpha(330), height: 550),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    color: Colors.transparent,
                    elevation: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'lib/assets/detail-placeholder.png',
                        image:
                            track.artworkUrl100?.replaceAll("100", "600") ?? "",
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    color: Colors.transparent,
                    width: 100,
                    child: Text(
                        style: TextStyle(
                            color: Colors.white70.withAlpha(200),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                        "${releaseDate.year.toString()} • ${duration.inHours.toString()}h"),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  track.trackName ?? track.collectionName ?? "-",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
                Text(
                  track.collectionArtistName ?? track.artistName ?? "",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70.withOpacity(0.7)),
                ),
                SizedBox(height: 18),
                Expanded(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withAlpha(190),
                          Colors.black,
                          Colors.black,
                          Colors.black,
                        ],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Column(
              children: [
                Container(
                  height: 350,
                ),
                FutureBuilder(
                  future: ColorScheme.fromImageProvider(provider: NetworkImage(track.artworkUrl100.toString())),
                  builder: (BuildContext context, AsyncSnapshot<ColorScheme> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    } else {
                      final color = snapshot.data!;

                      return Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 16, 14, 32),
                            child: Card(
                              color: Colors.transparent,
                              elevation: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        color.primaryContainer.withOpacity(0.7),
                                        color.inversePrimary.withOpacity(0.6)
                                      ],
                                      tileMode: TileMode.mirror,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
