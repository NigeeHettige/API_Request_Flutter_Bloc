import 'dart:async';
import 'package:flutter_bloc_api/features/posts/models/post_data_ui_model.dart';
import 'package:flutter_bloc_api/features/posts/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostFetchingLoadedState());
    List<PostDataUIModel> posts = await PostRepo.fetchPost();
    // print(posts);
    emit(PostFetchSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostsState> emit) async{
    bool success = await PostRepo.addPost();
    if(success){
      print('Success');
      emit(PostAdditionSuccessState());
    }else{
      emit(PostAdditionErrorState());
    }
  }
}
