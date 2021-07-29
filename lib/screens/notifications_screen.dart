import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/models/NotificationScreenListTile.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';
import 'package:kyros_app_mobile/widgets/search_bar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(

            preferredSize: Size.fromHeight(130.0),
            child: new Container(

              color: StyleConstants.black,
              child: new SafeArea(

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new TabBar(

                      tabs: [
                        new Container(
                          height: 20.0,
                          child: new Tab(text: 'Message Notifications'),
                        ),
                        new Container(
                          height: 50.0,
                          child: new Tab(text: 'Assignment Notifications'),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(

                          child: SizedBox(height: 10),
                        )
                    ),


                    Expanded(
                        child: Container(

                          child: SearchBar(),
                        )
                    ),

                    Expanded(
                        child: Container(

                          child: SizedBox(height: 10),
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),

          body: new TabBarView(

            children: <Widget>[

              new Column(
                children: <Widget>[
                  Expanded(
                    child: Container(

                      child: getListView(),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: getListView(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

// Creates a list of data for notifications
// in format [[title1, desc1], [title2, desc2], ...]
// TODO: this is a placeholder, replace with something that gets the actual info for notifications
List<List> getListElements() {
  var items = List<List>.generate(
      1000, (counter) => ["Notification $counter", "$counter Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam euismod, elit in laoreet gravida, lacus massa laoreet orci, a vulputate libero turpis et metus. Nulla sodales est luctus tortor ullamcorper, ac pharetra est pretium. Mauris id enim id ligula dictum sodales. Cras sit."]);
  return items;
}

// builds memory efficient list
// returns a built ListView
Widget getListView() {
  // create variable with list of data for notifications
  // needs format [[title1, desc1], [title2, desc2], ...]
  var listItems = getListElements();

  // build the thing
  var listView = ListView.builder(
      // padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      itemBuilder: (context, index) {
        return NotificationScreenListTile(
          title: Text(listItems[index][0]),
          description: Text(listItems[index][1]),
        );
      });

  // return built ListView when this function is called
  return listView;
}
