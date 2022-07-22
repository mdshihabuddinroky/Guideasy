import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:sizer/sizer.dart';

class Nearby extends StatefulWidget {
  const Nearby({Key? key}) : super(key: key);

  @override
  State<Nearby> createState() => _NearbyState();
}

var lat = (0.0).obs;
var lng = (0.0).obs;
var locationget = false.obs;

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    checkLocation();
    var finallat = (0.0).obs;
    var finallng = (0.0).obs;
    Set<Marker> _markers = {};
    googlemapcontroller(GoogleMapController) {
      setState(() {
        finallat(lat.value);
        finallng(lng.value);
        print('storing final lat: $finallat');

        _markers.add(Marker(
            markerId: MarkerId("1"),
            position: LatLng(lat.value, lng.value),
            //  icon: mapMarker,
            draggable: true,
            // icon: ,
            infoWindow: const InfoWindow(
                title: 'set location',
                snippet: 'We will deliver here your products')));
      });
    }

    late BitmapDescriptor mapMarker;
    void setCustomMarker() async {
      mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/pin.png',
      );
    }

    TextEditingController? searchfield;
    @override
    void initState() {
      checkLocation();
      setCustomMarker();
      super.initState();
    }

    var dropdownvalue1 = 'Bangla'.obs;
    var dropdownvalue2 = 'English'.obs;

    // List of items in our dropdown menu
    var items1 = [
      'Bangla',
      'English',
      'Urdu',
      'Hindi',
      'Arabic',
    ];
    return Obx(() => Scaffold(
          body: (locationget.value)
              ? SafeArea(
                  child: Stack(children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(lat.value, lng.value), zoom: 16),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: _markers,
                    onTap: (latlng) {
                      setState(() {
                        _markers.removeAll;
                        setState(() {
                          finallat(latlng.latitude);
                          finallng(latlng.longitude);

                          print('storing final lat: ');
                          _markers.add(Marker(
                              markerId: MarkerId("1"),
                              position:
                                  LatLng(latlng.latitude, latlng.longitude),
                              draggable: true,
                              //   icon: mapMarker,
                              infoWindow: const InfoWindow(
                                  title: 'set location',
                                  snippet:
                                      'We will deliver here your products')));
                        });

                        lat(latlng.latitude);
                        lng(latlng.longitude);
                      });
                    },
                  ),
                  Container(
                      height: 70,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(Icons.arrow_back)),
                            Spacer(),
                            Text(
                              "Seach Nearby",
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 3.w,
                            ),
                          ])),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                controller: searchfield,
                                onTap: () {},
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 186, 37, 37),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // label: Text("Search guid"),
                                  hintText: "Search address",
                                  alignLabelWithHint: true,
                                  hintStyle: GoogleFonts.lato(
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                  ),

                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 176, 162, 162),
                                        width: 1.5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(
                                        elevation: 0,
                                        value: dropdownvalue1.toString(),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: items1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          dropdownvalue1(value);
                                        },
                                      )),
                                  Icon(Icons.change_circle_outlined),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(
                                        elevation: 0,
                                        value: dropdownvalue2.toString(),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: items1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          dropdownvalue2(value);
                                        },
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (searchfield?.text == "") {
                                    print(searchfield?.text.toString());
                                    adtolet(searchfield?.text.toString());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent,
                                    shape: const StadiumBorder(),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.8.h, horizontal: 10.h)),
                                child: Text(
                                  'Search',
                                  style: GoogleFonts.poppins(fontSize: 16.sp),
                                )),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
        ));
  }
}

adtolet(address1) async {
  const _apiKey = 'AIzaSyDxljUfOIQJm2Ro77zd8kOZ_xGhQoOBdFI';
  final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  final address = await geocoder.findAddressesFromQuery(address1);
  print("address1");
}

lettoad(lat, lng) async {
  const _apiKey = 'AIzaSyDxljUfOIQJm2Ro77zd8kOZ_xGhQoOBdFI';
  final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  final address =
      await geocoder.findAddressesFromCoordinates(Coordinates(lat, lng));
  print(address.first.addressLine);
}

checkLocation() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();
  lat(_locationData.latitude);
  lng(_locationData.longitude);
  locationget(true);
  print("location finished");
}
