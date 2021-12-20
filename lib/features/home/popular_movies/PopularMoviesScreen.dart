import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:firstflutter/network/model/model_response.dart';
import 'package:firstflutter/network/model/popular_movies_remote.dart';
import 'package:firstflutter/network/movies_service.dart';
import 'package:flutter/material.dart';

class PopularMovies extends StatefulWidget {

   PopularMovies({Key? key}) : super(key: key);



  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  bool loading = false;
  List<Results> popularMovies =  [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response<Result<PopularMoviesRemote>>>(
      future: MoviesServices.create().getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          loading = false;
          // Hit an error
          if (false == snapshot.data?.isSuccessful) {
            var errorMessage = 'Problems getting data';
            if (snapshot.data?.error != null &&
                snapshot.data?.error is LinkedHashMap) {
              final map = snapshot.data?.error as LinkedHashMap;
              errorMessage = map['message'];
            }
            return Center(
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
              ),
            );
          }
          final result = snapshot.data?.body;
          if (result == null || result is Error) {
            // inErrorState = true;
            // return _buildRecipeList(context, currentSearchList);
           // debugPrint(result.toString());
            final query = (result as Success).value;
            popularMovies.addAll(query.results);
           // debugPrint(query.results.toString());
            return _buildRecipeList(context,query);
          }
          final query = (result as Success).value;
         // inErrorState = false;
          // currentCount = query.count;
          // hasMore = query.more;
          for(var i in query.results){
            popularMovies.add(i);
          }
         // popularMovies.addAll(query);

          // currentSearchList.addAll(query.hits);
          // if (query.to < currentEndPosition) {
          //   currentEndPosition = query.to;
          // }
           return _buildRecipeList(context, popularMovies);
        }
        else {
          return Center(child: Text("Bye"));
        }
       // debugPrint(query.toString());

        debugPrint(popularMovies.toString());
       // return _buildRecipeList(context,popularMovies);
        return Center(child: Text("Bye"));


        // else {
        //   if (currentCount == 0) {
        //     // Show a loading indicator while waiting for the movies
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   } else {
        //     return _buildRecipeList(context, currentSearchList);
        //   }
        // }
        },
    );
  }



  Widget _buildRecipeList(BuildContext recipeListContext, List<Results> hits) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: hits.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRecipeCard(recipeListContext, hits, index);
        },
      ),
    );
  }
  Widget _buildRecipeCard(
      BuildContext topLevelContext, List<Results> hits, int index) {
    final recipe = hits[index];
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return const RecipeDetails();
        //   },
        // ));
      },
      child: recipeCard(recipe),
    );
  }

}


Widget recipeCard(Results recipe) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         ClipRRect(
             borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
             child: CachedNetworkImage(imageUrl: "http://image.tmdb.org/t/p/w500"+recipe.backdropPath!, height: 200, fit: BoxFit.fill)),
        const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            recipe.originalTitle!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            recipe.originalTitle!,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    ),
  );
}
