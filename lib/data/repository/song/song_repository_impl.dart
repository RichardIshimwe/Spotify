import 'package:dartz/dartz.dart';
import 'package:spotify/data/resources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl implements SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
   return await sl<SongFirebaseService>().getNewsSongs();
  }
}