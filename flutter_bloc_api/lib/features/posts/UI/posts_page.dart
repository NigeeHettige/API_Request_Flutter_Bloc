import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/features/posts/bloc/posts_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
        backgroundColor:const  Color.fromARGB(255, 154, 201, 143),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: null,child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(250),color: Color.fromARGB(255, 212, 252, 148)),child: const Icon(Icons.add,color: Color.fromARGB(255, 40, 214, 46),weight: Checkbox.width,size: 45,)),onPressed: (){postsBloc.add(PostAddEvent());}),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listener: (context, state) {
          
        },
        listenWhen: (previous,current)=> current is PostActionState,
        buildWhen: (previous, current) => current is !PostActionState,
        builder: (context, state) {

          switch (state.runtimeType) {
            case PostFetchingLoadedState:
            return const Center(child: CircularProgressIndicator());
            case PostFetchSuccessfulState:
            final successState = state as PostFetchSuccessfulState;
               return Container(
                padding:const  EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
            child: ListView.builder(itemCount:successState.posts.length ,itemBuilder: (context,index){
              return Container(
                 padding:const  EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
               
               
                 decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Color.fromARGB(255, 172, 235, 211),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(successState.posts[index].title),
                    Text(successState.posts[index].body),
                  ],
                ),
              );
            }),
          );
            
            default:
            return SizedBox();
          }
         
        },
      ),
    );
  }
}
