import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_state.dart';
import '../Common/filters.dart';
import 'PreferitiBloc/preferiti_events.dart';

class FavouritesWidget extends StatelessWidget {
  const FavouritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PreferitiBloc, PreferitiState>(
          builder: (BuildContext context, PreferitiState state) {
        return Column(
          children: [
            SizedBox(height: 20,),
            Filters(
                filters: state.filters,
                selectedFilterIndex: state.selectedFilterIndex,
                filter: ((value, index) {
                  context.read<PreferitiBloc>().add(value == "RESET"
                      ? ResetFilterPreferitiEvent()
                      : FilterListPreferitiEvent(value, index));
                })),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                  scrollDirection: Axis.vertical,
                  children: [
                    ...state.preferitiObj.map((element) {
                      return Card(
                          color: Colors.deepPurple.shade50,
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "lib/assets/placeholder.jpg",
                                    image: element.artworkUrl100.toString(),
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                    child: Text("${element.artistName}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Flexible(
                                    child: Text("${element.trackName ?? "-"}",
                                        overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ));
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
