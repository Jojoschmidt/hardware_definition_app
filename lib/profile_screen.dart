import 'package:flutter/material.dart';
import 'package:hardware_definition_app/profile_list_parts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: media.height * 0.4,
                color: Color(0xFF959CB5),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 15),
                      child: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(width: media.width,height: 30,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Container(
                            constraints: BoxConstraints.tightFor(
                                width: media.width * 0.22,
                                height: media.width * 0.22),
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Gość',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'adres@email.com',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              constraints: BoxConstraints.tightFor(
                                  width: media.width * 0.7, height: 15),
                              color: Color(0xFF858BA1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            child: OutlineButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              borderSide: BorderSide(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                              onPressed: () => print('/info'),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Informacje',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                constraints: BoxConstraints.tightFor(
                                    width: media.width * 0.55, height: 50),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(45),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 30,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
                child: Column(
                  children: <Widget>[
                    ProfileListElement(
                        'Zapisane', '/saved', Icons.collections_bookmark),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Newsletter', '/newsletter', Icons.calendar_today),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Pomoc techniczna', '/support', Icons.headset_mic),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Twoje artykuły', '/your_articles', Icons.message),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Powiadomienia', '/notifications', Icons.notifications),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Konkursy', '/contests', Icons.card_giftcard),
                    ProfileListSeparator(),
                    ProfileListElement(
                        'Wesprzyj nas', '/donate', Icons.credit_card),
                    ProfileListSeparator(),
                    ProfileListElement('Rabaty dla użytkowników', '/promo',
                        Icons.priority_high),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height:50,)
        ],
      ),
    );
  }
}
