import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key, required this.character});

  final Character character;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
                width: double.infinity,
                child: Hero(
                    tag: character.id!,
                    child: Image.network(
                      character.image,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                
                height: size.height * 0.14,
                width: double.infinity,
                child: Row(
                  children: [
                    CardData("Status", character.status),
                    CardData("Specie", character.species),
                    CardData("Origin", character.origin.name),
                    ],
                ),
              )
            ],
          ),
        ));
  }

  Widget CardData(String str1, String str2) {
    return Expanded(
        child: Card(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(str1),
            SizedBox(height: 10,),
            Text(
              str2,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            )
          ]),
    ));
  }
}
