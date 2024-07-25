
import 'package:flutter/material.dart';

class ArtistCollectionResponse {
  late int? resultCount;
  late List<Results>? results;

  ArtistCollectionResponse({this.resultCount, this.results});

  ArtistCollectionResponse.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    results = <Results>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  late UniqueKey id;
 late String? wrapperType;
 late String? kind;
 late int? collectionId;
 late int? trackId;
 late String? artistName;
 late String ?collectionName;
 late String? trackName;
 late String? collectionCensoredName;
 late String? trackCensoredName;
 late int? collectionArtistId;
 late String? collectionArtistViewUrl;
 late String? collectionViewUrl;
 late String? trackViewUrl;
 late String? previewUrl;
 late String? artworkUrl30;
 late String? artworkUrl60;
 late String? artworkUrl100;
 late num? collectionPrice;
 late num? trackPrice;
 late num? trackRentalPrice;
 late num? collectionHdPrice;
 late num? trackHdPrice;
 late num? trackHdRentalPrice;
 late String? releaseDate;
 late String? collectionExplicitness;
 late String? trackExplicitness;
 late int? discCount;
 late int? discNumber;
 late int? trackCount;
 late int? trackNumber;
 late int? trackTimeMillis;
 late String? country;
 late String? currency;
 late String? primaryGenreName;
 late String? contentAdvisoryRating;
 late String? shortDescription;
 late String? longDescription;
 late bool? hasITunesExtras;
 late int? artistId;
 late String? artistViewUrl;
 late bool? isStreamable;
 late String? collectionArtistName;

  Results({
        required this.id,
        this.wrapperType,
        this.kind,
        this.collectionId,
        this.trackId,
        this.artistName,
        this.collectionName,
        this.trackName,
        this.collectionCensoredName,
        this.trackCensoredName,
        this.collectionArtistId,
        this.collectionArtistViewUrl,
        this.collectionViewUrl,
        this.trackViewUrl,
        this.previewUrl,
        this.artworkUrl30,
        this.artworkUrl60,
        this.artworkUrl100,
        this.collectionPrice,
        this.trackPrice,
        this.trackRentalPrice,
        this.collectionHdPrice,
        this.trackHdPrice,
        this.trackHdRentalPrice,
        this.releaseDate,
        this.collectionExplicitness,
        this.trackExplicitness,
        this.discCount,
        this.discNumber,
        this.trackCount,
        this.trackNumber,
        this.trackTimeMillis,
        this.country,
        this.currency,
        this.primaryGenreName,
        this.contentAdvisoryRating,
        this.shortDescription,
        this.longDescription,
        this.hasITunesExtras,
        this.artistId,
        this.artistViewUrl,
        this.isStreamable,
        this.collectionArtistName
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = UniqueKey();
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistViewUrl = json['collectionArtistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    trackRentalPrice = json['trackRentalPrice'];
    collectionHdPrice = json['collectionHdPrice'];
    trackHdPrice = json['trackHdPrice'];
    trackHdRentalPrice = json['trackHdRentalPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    hasITunesExtras = json['hasITunesExtras'];
    artistId = json['artistId'];
    artistViewUrl = json['artistViewUrl'];
    isStreamable = json['isStreamable'];
    collectionArtistName = json['collectionArtistName'];
  }
}