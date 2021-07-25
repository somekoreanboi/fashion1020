import 'package:bubble/bubble.dart';
import 'package:fashion1020/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  void showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.5),
          insetPadding: EdgeInsets.all(100),
          title: Text(
            "신고 사유",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  "폭력성",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "선전성",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildCommentBottomSheet(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Bubble(
            child: Text('솔직히 우리집 할머니도 이것보다는 잘 입을듯...'),
            nip: BubbleNip.rightBottom,
            margin: BubbleEdges.all(15),
          ),
          Bubble(
            child: Text('그냥 그러네'),
            nip: BubbleNip.rightBottom,
            margin: BubbleEdges.all(15),
          ),
        ],
      ),
    );
  }

  Widget buildFashionInfoBottomSheet(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Bubble(
            child: Text('상의: XX 브랜드'),
            margin: BubbleEdges.all(15),
          ),
          Bubble(
            child: Text('하의: XX 브랜드'),
            margin: BubbleEdges.all(15),
          ),
        ],
      ),
    );
  }

  ScrollPhysics physics = PageScrollPhysics();
  bool showIcons = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              physics: physics,
              children: [
                buildHpb(
                  image: NetworkImage(
                      'https://t1.daumcdn.net/cfile/tistory/230FB74258C3551F18'),
                ),
                buildHpb(
                  image: NetworkImage(
                      'https://t1.daumcdn.net/cfile/tistory/2160894258C3552019'),
                ),
              ],
            ),
            Visibility(
              visible: showIcons,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSideIcon(
                        context: context,
                        heroTag: 'fashion_info',
                        icon: FaIcon(
                          FontAwesomeIcons.tshirt,
                        ),
                        onPress: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              context: context,
                              builder: buildFashionInfoBottomSheet);
                        },
                      ),
                      buildSideIcon(
                        context: context,
                        heroTag: 'like',
                        icon: FaIcon(FontAwesomeIcons.thumbsUp),
                        onPress: () {},
                      ),
                      buildSideIcon(
                        context: context,
                        heroTag: 'share',
                        icon: FaIcon(
                          FontAwesomeIcons.shareAltSquare,
                        ),
                        onPress: () {},
                      ),
                      buildSideIcon(
                        context: context,
                        heroTag: 'report',
                        icon: FaIcon(
                          FontAwesomeIcons.fileSignature,
                        ),
                        onPress: () {
                          showReportDialog(context);
                        },
                      ),
                      buildSideIcon(
                        context: context,
                        heroTag: 'comments',
                        icon: FaIcon(
                          FontAwesomeIcons.comments,
                        ),
                        onPress: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              context: context,
                              builder: buildCommentBottomSheet);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageView buildHpb({
    required ImageProvider image,
  }) {
    return PageView(
      onPageChanged: (int index) {
        setState(
          () {
            if (index == 1) {
              showIcons = false;
              physics = NeverScrollableScrollPhysics();
            } else {
              showIcons = true;
              physics = PageScrollPhysics();
            }
          },
        );
      },
      scrollDirection: Axis.horizontal,
      children: [
        Image(
          image: image,
          fit: BoxFit.cover,
        ),
        ProfileScreen(
          displayName: '박진성',
        ),
      ],
    );
  }

  Padding buildSideIcon(
      {required BuildContext context,
      required String heroTag,
      required Widget icon,
      required VoidCallback onPress}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: onPress,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: icon,
        ),
      ),
    );
  }
}
