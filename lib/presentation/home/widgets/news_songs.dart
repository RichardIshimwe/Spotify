import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewsSongsLoadFailure) {
              return const Center(child: Text('Failed to load songs'));
            }
            if (state is NewsSongsLoaded) {
              return _song(state.songs);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _song(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                // AppUrls.firestorage +
                                //     songs[index].artist +
                                //     ' - ' +
                                //     songs[index].title +
                                //     '.jpg?' +
                                //     AppUrls.mediaAlt,
                                'https://firebasestorage.googleapis.com/v0/b/portfolio-81ac3.appspot.com/o/covers%2Fextrabass.jpg?alt=media',
                              )))),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 14);
        },
        itemCount: songs.length);
  }
}
