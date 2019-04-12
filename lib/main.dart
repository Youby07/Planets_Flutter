import 'package:flutter/material.dart';
import 'planet.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planets",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Planets"),
      ),
      body: ListView.builder(itemBuilder: (context, index) => new PlanetRow(planets[index]),itemCount: planets.length,)
    );
  }
}

class PlanetRow extends StatelessWidget{
  final Planet planet;
  PlanetRow(this.planet); //constructeur
  @override
  Widget build(BuildContext context) {
    final baseTextStyle = new TextStyle(
      fontFamily: "Poppins",
      color: Colors.white,
    );
    final headerTextStyle = baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18.0
    );
    final subHeaderTextStyle = baseTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: Color(0xffb6b2ff)
    );
    final regularTextStyle = baseTextStyle.copyWith(
      color: Color(0xffb6b2ff),
      fontSize: 10.0
    );
    final planetCardContent = new Container(
      margin: EdgeInsets.fromLTRB(60.0, 16.0, 0.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(planet.name, style: headerTextStyle,),
          new Container(height: 8.0,),
          new Text(planet.location, style: subHeaderTextStyle,),
          new Container(height: 8.0,),
          new Container(
            height: 2.0,
            width: 18.0,
            color: Color(0xff00c6ff),
          ),
          new Container(height: 10.0,),
          new Row(
            children: <Widget>[
              new Image.asset("img/ic_distance.png",height: 10.0,),
              new Container(width: 2.0,),
              new Text("54.6m", style: regularTextStyle),
              new Container(width: 10.0,),
              new Image.asset("img/ic_gravity.png",height: 10.0),
              new Container(width: 2.0,),
              new Text("3.11 m/s", style: regularTextStyle)
            ],
          )
        ],
      ),
    );
    final planetThumbnail = new Container(
      height: 92.0,
      width: 92.0,
      margin: EdgeInsets.fromLTRB(24.0, 16.0, 0.0, 16.0),
      child: new Image.asset(planet.image),
    );
    final planetCard = new Container(
      margin: EdgeInsets.only(left: 70.0,top: 0.0,right: 24.0,bottom: 0.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xFF333366),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            offset: Offset(2.0, 2.0)
          )
        ]
      ),
      child: planetCardContent,
    );
    return GestureDetector(
        child:Container (
          margin: EdgeInsets.symmetric(vertical: 16.0),
          height: 124.0,
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ),
       // onTap:() => Navigator.push(context,new MaterielPageRoute(builder:(context)=> new DetailPage(planet))),
    );
  }

}
class DetailPage extends StatelessWidget{
  final Planet planet;
  DetailPage (this.planet);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(planet.name)
     ),
         body: Stack(
       children: <Widget>[
         new Container(
           color: Colors.black26,
         ),
         PlanetDetailRow(planet),
   ],
   ),
   );
  }
}

class PlanetDetailRow extends StatelessWidget{
  final Planet planet;
 PlanetDetailRow (this.planet);
  @override
  Widget build(BuildContext context) {

    final planetThumbnail=new Container(
      height: 92,
      width: 92,
      constraints:BoxConstraints.expand() ,
      child: new Image.asset(planet.image),
    );
    final detailContainer =new Container(

    );
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.symmetric(vertical:50),
      height:180,
      child: Stack(
        children: <Widget>[
          detailContainer,
        ],
      ),
    );
  }
}


List<Planet> planets = [
  const Planet(
      id: "1",
      name: "Mars",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury. In English, Mars carries a name of the Roman god of war, and is often referred to as the 'Red Planet' because the reddish iron oxide prevalent on its surface gives it a reddish appearance that is distinctive among the astronomical bodies visible to the naked eye. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.",
      image: "img/mars.png",
  ),
  const Planet(
      id: "2",
      name: "Neptune",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and slightly larger than Neptune. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 astronomical units (4.50×109 km). It is named after the Roman god of the sea and has the astronomical symbol ♆, a stylised version of the god Neptune's trident",
      image: "img/neptune.png",
  ),
  const Planet(
      id: "3",
      name: "Moon",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "The Moon is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). Following Jupiter's satellite Io, the Moon is second-densest satellite among those whose densities are known.",
      image: "img/moon.png",
  ),
  const Planet(
      id: "4",
      name: "Earth",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Earth is the third planet from the Sun and the only object in the Universe known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth revolves around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times.",
      image: "img/earth.png",
  ),
  const Planet(
      id: "5",
      name: "Mercury",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period around the Sun of 88 days is the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger to the gods.",
      image: "img/mercury.png",

  ),
];