import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/236x/4e/a3/90/4ea39052882321c3aa7f182d384260cf--spiderman-marvel-marvel-art.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SM'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage('https://i.pinimg.com/originals/04/88/cf/0488cf690fc02dfde19829076474739f.png'),
        ) 
      ),
    );
  }
}