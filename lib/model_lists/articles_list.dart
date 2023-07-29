import 'package:astro_info/models/article.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void addArticleToFB() async{
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app');
for(var art in articlesList){
DatabaseReference ref = rtdb.ref("Articles");
DatabaseReference objectListRef = ref.push();
  objectListRef.set({
      "title": art.title,
      "subtitle": art.subtitle,
      "content": art.content,
      "date": DateTime.now().toString(),
      "numberOfReaders": 0,
      "photo": art.numberOfReaders
  
});
  
}
print("Added!");
  }

void readArticleFromFB(){
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app');
DatabaseReference ref = rtdb.ref("Articles").child("Helix Nebula");

}
List<Article> articlesList = [
  Article(
      title: "Helix Nebula",
      subtitle: "Is it future of our Sun?",
      content: "Test content",
      date: DateTime.now(),
      numberOfReaders: 0,
      photo:"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/NGC7293_%282004%29.jpg/1200px-NGC7293_%282004%29.jpg"
  ),
    Article(
      title: "What is ISS?",
      subtitle: "The most expensive structure ever",
      content: "Test content",
      date: DateTime.now(),
      numberOfReaders: 0,
      photo:"https://www.nasa.gov/sites/default/files/thumbnails/image/final_configuration_of_iss.jpg"
  ),
];
