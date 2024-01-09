import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../api/posts_repository.dart';
import '../models/post_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required PostsRepository postsRepository})
      : _postsRepository = postsRepository,
        super(PostsInitial());

  final PostsRepository _postsRepository;

  Future<void> getPosts() async {
    try {
      emit(PostsLoading());
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        final serverResponse = await _postsRepository.getPosts();
        await _postsRepository.savePostsLocally(posts: serverResponse);
        final localPosts = await _postsRepository.fetchAllLocalPosts();
        emit(PostsLoaded(response: localPosts));
      } else {
        final localPosts = await _postsRepository.fetchAllLocalPosts();
        emit(PostsLoaded(response: localPosts));
      }
    } catch (e) {
      emit(PostsError(error: e.toString()));
    }
  }
}