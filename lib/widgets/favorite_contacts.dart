import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Favorite Contacts',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
                iconSize: 30.0,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext buildContext, int index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(

                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(favorites[index].imageUrl),
                      ),
                      SizedBox(height: 6.0,),
                      Text(favorites[index].name,
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: Colors.blueGrey,
                         fontSize: 16.0,
                       ),)
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
