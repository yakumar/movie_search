import 'dart:async';

import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
//import '../blocs/stories_bloc.dart';


class NewsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();


    return new Scaffold(
      appBar: AppBar(

        title: new Text('Top News'),
        
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),

        child: buildList(bloc),
      ),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
        builder: (context, AsyncSnapshot<List<int>> snapshot){
          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.green,));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, int index){
                  return Text('${snapshot.data[index]}');
                }
            );
          }

        }
    );


  }


}
