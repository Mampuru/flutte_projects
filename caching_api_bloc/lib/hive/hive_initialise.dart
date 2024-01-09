import 'package:hive/hive.dart';

import '../api/posts_repository.dart';
import '../models/post_model.dart';

Future<void> initialiseHive() async {
  //key
  const postsKey = 'posts';
  //adapters
  Hive.registerAdapter(PostsModelAdapter());
  //box
  final postsBox = await Hive.openBox<PostsModel?>(postsKey);
  //repos
  PostsRepository(postsBox: postsBox);
}