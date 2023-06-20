import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/theme_Light.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.056014037359486, 31.317104360443036),
    zoom: 14.4746,
  );
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'كلية الهندسة بنات'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(30.056014037359486, 31.317104360443036),
  );

  static const CameraPosition _kHospital = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.05445535370686, 31.31413312532063),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'مستشفى جامعة الازهر'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(30.05445535370686, 31.31413312532063),

  );
  static final Polyline _kPolyline=Polyline(
    color: Colors.blue,
    polylineId:PolylineId('_kPolyline'),
    points: [
      LatLng(30.056014037359486, 31.317104360443036),
      LatLng(30.05445535370686, 31.31413312532063),

    ],
    width: 5,
  );
  static final Marker _kGoogleMarker1 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Dr: Ali Mohammed'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    position: LatLng(30.057221235421494, 31.31353165809257),

  );
  static final Marker _kGoogleMarker2 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Dr:Asmaa Osama'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),

    position: LatLng(30.053761774416568, 31.328553265595374),

  );
  static final Marker _kGoogleMarker3 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Dr: Mohamed Ashraf'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    position: LatLng(30.057493436071805, 31.331403154529916),

  );
  static final Marker _kGoogleMarker4 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Dr: Khaled Nagy'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    position: LatLng(30.044003501416316, 31.328434884791516),

  );
  static final Marker _kGoogleMarker5 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Dr: Yousef Ali'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    position: LatLng(30.04868790769841, 31.327699874326093),

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.WitheToDarkColor(context),
        leading: InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, RouteGenerator.FindDoctorHScreen);
            },
            child: Icon(Icons.arrow_back_ios ,color: ColorManager.DarkBasiColor(context),size: 25,)),
        title: Text("Find The Nearest Doctor",style: txtStyle(ColorManager.DarkBasiColor(context), 20.0, true),),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers:{
          _kGooglePlexMarker,
          _kLakeMarker,
          _kGoogleMarker1,
          _kGoogleMarker2,
          _kGoogleMarker3,
          _kGoogleMarker4,
          _kGoogleMarker5
        } ,
        // polylines: {
        //   _kPolyline,
        // },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kHospital));
  }
}