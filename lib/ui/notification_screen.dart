import 'package:flutter/material.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:testproject/controller/profile_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController searchController = TextEditingController();
  String? filter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 80,
        title: const Text("Profile App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xff6571FF))),
        actions: [
          SizedBox(
            width: 500,
            child: Center(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () async {

            },
            child: const CircleAvatar(
              child: Icon(Icons.account_circle_rounded, size: 40),
            ),
          ),
          const SizedBox(
            width: 100,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 50, 200, 10),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Text("Notifications",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                    ),
                    const Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: ProfileController().notificationData.length,
                      itemBuilder: (context, index) {
                        Map<String, String> data =
                            ProfileController().notificationData[index];
                        if (filter == null || filter == "") {
                          return ListTile(
                            title: Text("${data["title"]}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data["subtitle"]}"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("${data["time"]}"),
                              ],
                            ),
                            trailing: const CircleAvatar(
                                backgroundColor: Colors.red, radius: 5),
                          );
                        } else {
                          if (data["title"]!
                              .toLowerCase()
                              .contains(filter!.toLowerCase())) {
                            return ListTile(
                              title: Text("${data["title"]}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${data["subtitle"]}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${data["time"]}"),
                                ],
                              ),
                              trailing: const CircleAvatar(
                                  backgroundColor: Colors.red, radius: 5),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        if (filter == null || filter == "") {
                          return const Divider();
                        } else {
                          Map<String, String> data =
                              ProfileController().notificationData[index];
                          if (data["title"]!
                              .toLowerCase()
                              .contains(filter!.toLowerCase())) {
                            return const Divider();
                          } else {
                            return const SizedBox();
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 200,
            ),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Text("Updates",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                    ),
                    const Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: ProfileController().updateData.length,
                      itemBuilder: (context, index) {
                        Map<String, String> data =
                            ProfileController().updateData[index];
                        if (filter == null || filter == "") {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${data["title"]}"),
                                Text("${data["time"]}"),
                              ],
                            ),
                            subtitle: Text("${data["subtitle"]}"),
                          );
                        } else {
                          if (data["title"]!
                              .toLowerCase()
                              .contains(filter!.toLowerCase())) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${data["title"]}"),
                                  Text("${data["time"]}"),
                                ],
                              ),
                              subtitle: Text("${data["subtitle"]}"),
                            );
                          } else {
                           return const SizedBox();
                          }
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
