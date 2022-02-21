import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_practical_task/view_models/result_list_view_model.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {

  // Completer<GoogleMapController> _controller = Completer();
  // double lat = 37.42796133580664,
  //     long = -122.085749655962;
  ListResultViewModel listResultViewModel = ListResultViewModel();

  @override
  void initState() {
    // TODO: implement initStat
    listResultViewModel.fetchResList();
    super.initState();
  }



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title : Text("Map")),
        /* Map APi key not working, So listing data below retrieving data from database through api call */

        // body: GoogleMap(
        //   mapType: MapType.normal,
        //   markers: {Marker(
        //     markerId: MarkerId('_kGoogleMarker'),
        //     infoWindow: InfoWindow(
        //       title: "My Location",
        //     ),
        //     icon: BitmapDescriptor.defaultMarker,
        //     position: LatLng(lat, long),
        //   )},
        //   initialCameraPosition: _kGooglePlex,
        //   onMapCreated: (GoogleMapController controller) {
        //     _controller.complete(controller);
        //   },
        // ),

        body: FutureBuilder(
            future: listResultViewModel.fetchResList(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else {
                return ListView.builder(
                    reverse: false,
                    shrinkWrap: true,
                    itemCount: listResultViewModel.result!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var article = listResultViewModel.result![index];
                      return GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(article.icon!),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
                                                child: Text(article.name!),
                                              ),
                                              Text(article.vicinity.toString()),
                                              Text("Latitude: "+article.lat.toString()),
                                              Text("Longitude: "+article.lng.toString()),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                )
                            ),
                          ),);
                    });
              }

            }
        )

    );
  }
}
