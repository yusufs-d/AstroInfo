
enum Category {planet,star,nebula,galaxy,blackHole, neutronStar}

class Object{
  const Object({
    required this.name,
    required this.category,
    required this.subtitle,
    required this.content,  
    required this.photo,  
    required this.numberOfSatellites,
    required this.mass,
    required this.radius,
    required this.surfaceArea,
    required this.temperature,

  });

  final String name, subtitle, content,photo;
  final Category category;
  final int numberOfSatellites;
  final double mass, radius, surfaceArea, temperature;

}