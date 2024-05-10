part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}


final class PostsInitial extends PostsState {}

class PostActionState extends PostsState{

}

class PostFetchingLoadedState extends PostsState{

}

class PostFetchSuccessfulState extends PostsState{
  final List <PostDataUIModel> posts;

  PostFetchSuccessfulState({required this.posts});

}

class PostFetchFailedState extends PostsState{
  final String error;

  PostFetchFailedState({required this.error});

}

class PostAdditionSuccessState extends PostActionState{
  
}
class PostAdditionErrorState extends PostActionState{

}


