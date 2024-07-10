import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled/modules/popular_movie_in_facebook_network/controllers/movie_network_controller.dart';
import '../../../model/movie.dart';
import '../../../model/person.dart';

class MovieNetworkScreen extends GetView<MovieNetworkController>{


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MovieNetworkController>(
          () => MovieNetworkController(),
    );

    // Sample data


    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Network'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text("Here is the Most Popular Movie in your Network Game, tap on 'Start' to play and know the most popular movie "
                "in your network", style: TextStyle(fontSize: 20), textAlign: TextAlign.justify,),
            const SizedBox(height: 80,),

            GestureDetector(
              onTap: (){

                showDialog(context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: const EdgeInsets.all(10),
                        child: Container(
                            padding: const EdgeInsets.all(20),
                          child: ListView(
                            children: [
                              const Text("What's your name?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                              TextFormField(
                                decoration: const InputDecoration(hintText: 'Input Your name',

                                ),
                                onChanged: (value){
                                  controller.your_name = value;
                                },
                              ),
                              const SizedBox(height: 20,),
                              const Text("What are your films?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                              for(int i = 0; i< controller.movies.length; i++)...[
                                GestureDetector(
                                  onTap:(){
                                    if(controller.my_movies.contains(controller.movies[i] )){
                                      controller.my_movies.remove(controller.movies[i] );
                                      controller.my_movies_obx.remove(controller.movies[i] );
                                    }
                                    else{
                                      controller.my_movies.add(controller.movies[i]);
                                      controller.my_movies_obx.add(controller.movies[i]);
                                    }


                                  },
                                  child: Obx(() => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: !controller.my_movies_obx.contains(controller.movies[i])?
                                        Border.all(color: Colors.grey):
                                        Border.all(color: Colors.green, width: 2)

                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('${controller.movies[i].name}', style: const TextStyle(fontSize: 20), ),
                                  ),
                                  )
                                ),
                                const SizedBox(height: 10,)

                              ],
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Who are your friends?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),


                              for(int i = 0; i< controller.persons.length; i++)...[
                                  GestureDetector(
                                    onTap:(){
                                      if(controller.my_friends.contains(controller.persons[i])){
                                        controller.my_friends.remove(controller.persons[i]);
                                        controller.my_friends_obx.remove(controller.persons[i]);
                                      }
                                      else{
                                        controller.my_friends.add(controller.persons[i]);
                                        controller.my_friends_obx.add(controller.persons[i]);
                                      }


                                    },
                                    child: Expanded(
                                      child: Obx(() => Container(
                                        padding: const EdgeInsets.only(left: 10, right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: !controller.my_friends_obx.contains(controller.persons[i])?
                      Border.all(color: Colors.grey):
                                            Border.all(color: Colors.green, width: 2)
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Friend $i : ${controller.persons[i].name}',style: const TextStyle(fontSize: 20) ),
                                            Wrap(children: [
                                              const Text("Films: ", style: const TextStyle(fontSize: 20)),
                                              for(int j = 0; j<controller.persons[i].likedMovies.length; j++)...[
                                                Text('${controller.persons[i].likedMovies[j].name}, ', style: const TextStyle(fontSize: 16))

                                              ],
                                            ],)


                                          ],
                                        ),
                                      ),),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 10,
                                )

                                ],
                             Obx(() => !controller.played.value?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Remark:', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),),
                                  const Text('- Alice is friend with Bob and Charlie', style: TextStyle(fontSize: 20),),
                                  const Text('- Bob is friend with Charlie and the reverse is true', style: TextStyle(fontSize: 20)),
                                  GestureDetector(
                                    onTap:(){
                                      var me = Person(controller.your_name, controller.my_movies, controller.my_friends);
                                      controller.most_played_film = controller.getMostPopularMovie(me);
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        child: const Text('Play'),
                                      ),
                                    ),
                                  )
                                ],
                              )
                             :Column(

                               children: [
                                 const SizedBox(height: 20,),

                                 Text("The most Played film in the network of '${controller.your_name}' is: ${controller.most_played_film}",
                                 style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 GestureDetector(
                                   onTap:(){
                                     controller.my_movies.clear();
                                     controller.my_friends.clear();
                                     controller.my_movies_obx.clear();
                                     controller.my_friends_obx.clear();
                                     controller.played.value = false;

                                   },
                                   child: Container(
                                     decoration: BoxDecoration(
                                         color: Colors.teal,
                                         borderRadius: BorderRadius.circular(20)
                                     ),
                                     padding: const EdgeInsets.all(20),
                                     child: const Text('Reset'),
                                   ),
                                 )
                               ],

                      ))



                              ],



                          )
                        ),
                      );
                    },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 5)),
              ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.green,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text('Start', style: TextStyle(fontSize: 24),)),
                      Icon( Icons.not_started_outlined, color: Colors.black ,size: 30,)

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
