import 'package:astro_info/models/object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void addObjectToFB() async{
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app');
for(var obj in objectList){
  DatabaseReference ref = rtdb.ref("Objects");
DatabaseReference objectListRef = ref.push();
  objectListRef.set({
  "name": obj.name,
  "photo": obj.photo,
  "subtitle": obj.subtitle,
  "category": obj.category.toString(),
  "content": obj.content,
  "numberOfSatellites": obj.numberOfSatellites,
  "mass": obj.mass,
  "surfaceArea": obj.surfaceArea,
  "radius": obj.radius,
  "temperature": obj.radius,
  
});
  
}

print("Added!");
  }

void readObjectFromFb() async{
  final firebaseApp = Firebase.app();
  final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app');
  DatabaseReference ref = rtdb.ref("Objects");
  ref.onChildAdded.listen((DatabaseEvent event) {
    for(final child in event.snapshot.children){
      print(child.value);
    }

});

// Print the data of the snapshot
}

final List<Object> objectList = [
const Object(
  name: "Merkur",
  photo: "images/planets/merkur.png",
  subtitle: "Stone planet of our Solar System",
  category: Category.planet,
  content: "This is merkur",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Venus",
  photo: "images/planets/venus.png",
  subtitle: "Hot planet of our Solar System",
  category: Category.planet,
  content: "This is Venus",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Earth",
  photo: "images/planets/earth.png",
  subtitle: "Our Home",
  category: Category.planet,
  content: "This is Earth",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Mars",
  photo: "images/planets/mars.png",
  subtitle: "Red planet of our Solar System",
  category: Category.planet,
  content: "This is Mars",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Jupiter",
  photo: "images/planets/jupiter.png",
  subtitle: "Gas Giant",
  category: Category.planet,
  content: "This is Jupiter",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Saturn",
  photo: "images/planets/saturn.png",
  subtitle: "Planet with Ring",
  category: Category.planet,
  content: "This is Saturn",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Uranus",
  photo: "images/planets/uranus.png",
  subtitle: "Blue Gas Giant",
  category: Category.planet,
  content: "This is Uranus",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Neptune",
  photo: "images/planets/neptune.png",
  subtitle: "Out Gas Giant",
  category: Category.planet,
  content: "This is Naptune",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),
const Object(
  name: "Sun",
  photo: "images/planets/sun.png",
  subtitle: "Our Sun",
  category: Category.star,
  content: "This is Sun",
  numberOfSatellites: 2,
  mass: 2.22,
  surfaceArea: 2.55,
  radius: 34.4,
  temperature: 56.33,
),

]; 