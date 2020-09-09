import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resumeflutter/utils/Title.dart';
import 'package:resumeflutter/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  _launchURL(int index) async {
    if (await canLaunch(urlList[index])) {
      await launch(urlList[index]);
    } else {
      throw 'Could not launch ${urlList[index]}';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.50,
      width: size.width,
      color: defaultLighter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomTitle(
            center: true,
            text: 'Contact Me',
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: defaultGrey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        location,
                        style: styleDescription,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        color: defaultGrey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SelectableText(
                        email,
                        style: styleDescription,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Follow Me On',
                    style: styleRole,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: size.width * 0.02,
                        child: ListView.builder(
                          itemCount: social.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _launchURL(index);
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Tooltip(
                                    message: socialName[index],
                                    child: Image.asset(
                                      social[index],
                                      height: size.width * 0.02,
                                      width: size.width * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
