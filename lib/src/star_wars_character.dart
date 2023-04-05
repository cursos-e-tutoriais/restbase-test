// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StarWarsCharacter {
  final String? name;
  // final String? height;
  // final String? mass;
  // final String? hairColor;
  // final String? skinColor;
  // final String? eyeColor;
  // final String? birthYear;
  // final String? gender;
  // final String? homeWorld;
  // final List<String>? films;
  // final List<String>? species;
  // final List<String>? vehicles;
  // final List<String>? starShips;
  // final String? created;
  // final String? edited;
  // final String? url;

  StarWarsCharacter(
    this.name,
    // this.height,
    // this.mass,
    // this.hairColor,
    // this.skinColor,
    // this.eyeColor,
    // this.birthYear,
    // this.gender,
    // this.homeWorld,
    // this.films,
    // this.species,
    // this.vehicles,
    // this.starShips,
    // this.created,
    // this.edited,
    // this.url,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      // 'height': height,
      // 'mass': mass,
      // 'hairColor': hairColor,
      // 'skinColor': skinColor,
      // 'eyeColor': eyeColor,
      // 'birthYear': birthYear,
      // 'gender': gender,
      // 'homeWorld': homeWorld,
      // 'films': films,
      // 'species': species,
      // 'vehicles': vehicles,
      // 'starShips': starShips,
      // 'created': created,
      // 'edited': edited,
      // 'url': url,
    };
  }

  factory StarWarsCharacter.fromJson(Map<String, dynamic> map) {
    return StarWarsCharacter(
      map['name'] != null ? map['name'] as String : null,
      // map['height'] != null ? map['height'] as String : null,
      // map['mass'] != null ? map['mass'] as String : null,
      // map['hairColor'] != null ? map['hairColor'] as String : null,
      // map['skinColor'] != null ? map['skinColor'] as String : null,
      // map['eyeColor'] != null ? map['eyeColor'] as String : null,
      // map['birthYear'] != null ? map['birthYear'] as String : null,
      // map['gender'] != null ? map['gender'] as String : null,
      // map['homeWorld'] != null ? map['homeWorld'] as String : null,
      // map['films'] != null
      //     ? List<String>.from((map['films'] as List<String>))
      //     : null,
      // map['species'] != null
      //     ? List<String>.from((map['species'] as List<String>))
      //     : null,
      // map['vehicles'] != null
      //     ? List<String>.from((map['vehicles'] as List<String>))
      //     : null,
      // map['starShips'] != null
      //     ? List<String>.from((map['starShips'] as List<String>))
      //     : null,
      // map['created'] != null ? map['created'] as String : null,
      // map['edited'] != null ? map['edited'] as String : null,
      // map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}
