import 'package:cab_connect/view/home/run_ride_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../common/color_extension.dart';
import '../../common/title_subtitle_row.dart';

class TipDetailsView extends StatefulWidget {
  const TipDetailsView({super.key});

  @override
  State<TipDetailsView> createState() => _TipRequestViewState();
}

class _TipRequestViewState extends State<TipDetailsView> with OSMMixinObserver {
  bool isOpen = true;

  late MapController controller;
  //23.02756018230479, 72.58131973941731
  //23.02726396414328, 72.5851928489523

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = MapController(
      initPosition:
          GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
    );

    controller.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.lightGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 30,
            height: 30,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Trip Details',
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Image.asset(
              "assets/img/question_mark.png",
              width: 20,
              height: 20,
            ),
            label: Text(
              'Help',
              style: TextStyle(
                color: TColor.primary,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: TColor.secondary,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "1 Ash Park, Pembroke Dock, SA72",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(color: TColor.primary),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "54 Hollybank Rd, Southampton",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.width,
              height: context.width * 0.5,
              child: OSMFlutter(
                controller: controller,
                osmOption: OSMOption(
                    enableRotationByGesture: true,
                    zoomOption: const ZoomOption(
                      initZoom: 8,
                      minZoomLevel: 3,
                      maxZoomLevel: 19,
                      stepZoom: 1.0,
                    ),
                    staticPoints: [],
                    roadConfiguration: const RoadOption(
                      roadColor: Colors.blueAccent,
                    ),
                    markerOption: MarkerOption(
                      defaultMarker: const MarkerIcon(
                        icon: Icon(
                          Icons.person_pin_circle,
                          color: Colors.blue,
                          size: 56,
                        ),
                      ),
                    ),
                    showDefaultInfoWindow: false),
                onMapIsReady: (isReady) {
                  if (isReady) {
                    print("map is ready");
                  }
                },
                onLocationChanged: (myLocation) {
                  print("user location :$myLocation");
                },
                onGeoPointClicked: (myLocation) {
                  print("GeoPointClicked location :$myLocation");
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "\$154.46",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Payment made successfully by Cash",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: .4,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "15 min",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Time",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: TColor.lightGray.withOpacity(0.5),
                          width: 1,
                          height: 70,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10 mi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Distance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: .4,
                    color: Colors.grey[400],
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Column(
                      children: [
                        TitleSubtitleRow(
                          title: "Date & Time",
                          subtitle: "22 Jan'24 at 10:00pm",
                        ),
                        TitleSubtitleRow(
                          title: "Service Type",
                          subtitle: "Sedan",
                        ),
                        TitleSubtitleRow(
                          title: "Trip Type",
                          subtitle: "Normal",
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: .4,
                    color: Colors.grey[400],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You rated \"Akash\"",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/img/ride_user_profile.png",
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 20,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: TColor.primary,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "RECEIPT",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "\$154.46",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        TitleSubtitleRow(
                          title: "Trip fares",
                          subtitle: "\$40.25",
                          color: TColor.secondaryText,
                        ),
                        TitleSubtitleRow(
                          title: "Fee",
                          subtitle: "\$12.30",
                          color: TColor.secondaryText,
                        ),
                        TitleSubtitleRow(
                          title: "+Tax",
                          subtitle: "\$400",
                          color: TColor.secondaryText,
                        ),
                        TitleSubtitleRow(
                          title: "+Tolls",
                          subtitle: "\$400",
                          color: TColor.secondaryText,
                        ),
                        TitleSubtitleRow(
                          title: "+Discount",
                          subtitle: "\$30.34",
                          color: TColor.secondaryText,
                        ),
                        TitleSubtitleRow(
                          title: "+Topup Added",
                          subtitle: "\$20.00",
                          color: TColor.secondaryText,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: .5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TitleSubtitleRow(
                      title: "Your payment",
                      subtitle: "\$1050.00",
                      color: TColor.primary,
                      weight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "This trip was towards your destination you recieved Guaranteed fare",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addMarker() async {
    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/pickup_pin.png",
          width: 80,
          height: 80,
        ),
      ),
    );

    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/drop_pin.png",
          width: 80,
          height: 80,
        ),
      ),
    );

    //23.02756018230479, 72.58131973941731
    //23.02726396414328, 72.5851928489523

    await controller.setStaticPosition(
        [GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731)],
        "pickup");

    await controller.setStaticPosition(
        [GeoPoint(latitude: 23.02726396414328, longitude: 72.5851928489523)],
        "dropoff");

    loadMapRoad();
  }

  void loadMapRoad() async {
    await controller.drawRoad(
        GeoPoint(latitude: 23.02756018230479, longitude: 72.58131973941731),
        GeoPoint(latitude: 23.02726396414328, longitude: 72.5851928489523),
        roadType: RoadType.car,
        roadOption:
            const RoadOption(roadColor: Colors.lightBlue, roadBorderWidth: 3));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
