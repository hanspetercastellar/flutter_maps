import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Index extends StatefulWidget {
  final String titulo;
  Index({Key key,this.titulo}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  MapController _mapController;

    var points = <LatLng>[
        LatLng(51.0,-0.09),
        LatLng(53.3498, -6.2603),
        LatLng(48.8566, -2.3522),
    ];

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out),
         onPressed: () {
            var newZoom = _mapController.zoom - 1;
            _mapController.move(_mapController.center, newZoom);          
         },
        ) ,
        appBar: new AppBar(title: new Text('Leaflet Maps')),
          body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(11.0156228, -74.8206213),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://a.tile.openstreetmap.org/"
                "{z}/{x}/{y}.png",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoiaGFuY2VsMTUxMiIsImEiOiJjazZpbTJuMnAwMmdhM2ZudWZwc3diN2piIn0.iK9umN_Nd0eLki-r8e0_bA',
              'id': 'mapbox.streets',
            },
            subdomains: ["a","b",]
          ),
          new PolylineLayerOptions(
            polylines: [
                Polyline(
                points: points,
                color: Colors.blueAccent,
                strokeWidth: 4.0,
              )
            ]
           
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(51.5, -0.09),
                builder: (ctx) =>
                new Container(
                  child: new FlutterLogo(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}