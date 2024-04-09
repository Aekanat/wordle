
import 'dart:math';
import 'package:flutter/material.dart';
class dataService extends StatelessWidget {
  const dataService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  String dataCaller(String category) {
  final List<String> meals = [
    "pizza",
    "cake",
    "fries",
    "pasta",
    "sandwich",
    "lasagna",
    "sushi",
    "taco",
    "burrito",
    "pancake",
    "waffle",
    "omelette",
    "cheese",
    "meatloaf",
    "spaghetti",
  ];

   final List<String> sport = [
    "soccer",
    "basketball",
    "tennis",
    "swimming",
    "running",
    "cycling",
    "volleyball",
    "golf",
    "baseball",
    "football",
    "surfing",
    "skating",
    "skiing",
    "wrestling",
    "karate",
    "yoga",
    "bowling",
    "gymnastics",
    "rowing",
    "sailing",
    "climbing",
    "fishing",
    "judo",
    "rugby",
    "biking",
    "dancing",
    "trampoline",
    "shooting",
    "canoeing",
    "parkour",
    "skydiving",
    "surf",
    "boxing",
  ];

   final List<String> job = [
    "teacher",
    "nurse",
    "police",
    "firefighter",
    "engineer",
    "chef",
    "artist",
    "musician",
    "actor",
    "writer",
    "scientist",
    "dentist",
    "mechanic",
    "electrician",
    "plumber",
    "barista",
    "cashier",
    "waiter",
    "gardener",
    "cleaner",
    "janitor",
    "librarian",
    "coach",
    "athlete",
    "pilot",
    "farmer",
    "photographer",
    "baker",
    "tailor",
    "hairdresser",
    "tutor",
    "editor",
    "designer",
    "architect",
    "lawyer",
    "judge",
    "banker",
    "accountant",
  ];

   final List<String> fruit = [
   "apple",
    "banana",
    "orange",
    "grape",
    "strawberry",
    "watermelon",
    "pineapple",
    "blueberry",
    "mango",
    "pear",
    "peach",
    "plum",
    "cherry",
    "lemon",
    "lime",
    "coconut",
    "avocado",
    "pomegranate",
    "papaya",
    "raspberry",
    "blackberry",
    "guava",
    "cranberry",
    "dragonfruit",
    "lychee",
    "kiwi",
    "melon",
    "starfruit",
    "grapefruit",
    "mulberry",
    "honeydew",
    "jackfruit",
  ];

   final List<String> vehicle = [
    "car",
    "truck",
    "motorcycle",
    "bicycle",
    "bus",
    "van",
    "scooter",
    "train",
    "boat",
    "airplane",
    "helicopter",
    "taxi",
    "fire truck",
    "police car",
    "tractor",
    "ambulance",
    "snowmobile",
  ];

   final List<String> animal = [
  "dog",
  "cat",
  "bird",
  "fish",
  "rabbit",
  "hamster",
  "turtle",
  "frog",
  "snake",
  "mouse",
  "horse",
  "cow",
  "pig",
  "sheep",
  "goat",
  "chicken",
  "duck",
  "goose",
  "penguin",
  "parrot",
  "elephant",
  "lion",
  "tiger",
  "bear",
  "zebra",
  "giraffe",
  "hippo",
  "rhino",
  "kangaroo",
  "koala",
  "panda",
  "monkey",
  "gorilla",
  "sloth",
  "koala",
  "panda",
  "cheetah",
  "leopard",
  "wolf",
  "fox",
  "deer",
  "moose",
  "buffalo",
];

switch (category.toLowerCase()) {
      case 'm':
      return meals[Random().nextInt(meals.length)];
      case 's':
      return sport[Random().nextInt(sport.length)];
      case 'j':
      return job[Random().nextInt(job.length)];
      case 'f':
      return fruit[Random().nextInt(fruit.length)];  
      case 'v':
      return vehicle[Random().nextInt(vehicle.length)];  
      case 'a':
       return animal[Random().nextInt(animal.length)]; 
      default:
        return '';
    }
  }
  

}




