import 'package:flutter/material.dart';

class HospitalInfo extends StatefulWidget {
  const HospitalInfo({Key? key}) : super(key: key);

  @override
  State<HospitalInfo> createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/ic_ok.png",
                      width: 48.0,
                      height: 48.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Square Hospital",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Green Road Dhaka",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black38),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.navigation_rounded,
                                size: 12,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "4.2 km away",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 10),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 12,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "0194667899",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 10),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.lan_outlined,
                                size: 12,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.bed,
                                size: 12,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("4.8"),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "20% savings",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      " ৳ 6,500",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
