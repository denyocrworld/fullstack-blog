import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

import '../../../service/auth_service/auth_service.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    if (controller.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("DN - Tech Blogs"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "6",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(MdiIcons.chatQuestion),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.notifications),
              ),
            ),
          ),
          if (AuthService.token == null)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              icon: const Icon(
                Icons.login,
                size: 24.0,
              ),
            ),
          if (AuthService.token != null)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileView()),
                );
              },
              icon: const Icon(
                Icons.person,
                size: 24.0,
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getBlogs(),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey[900],
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () => controller.getBlogs(),
                        icon: Icon(
                          Icons.refresh,
                          size: 24.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.blogs.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> item = controller.blogs[index];
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item["photo"],
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[900],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      item["creator"]["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            item["title"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            item["content"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            DateFormat("d MMM y kk:mm:ss")
                                .format(DateTime.parse(item["created_at"])),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
