import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              children: [
                Image(
                  image: NetworkImage(
                      'https://t1.daumcdn.net/cfile/tistory/230FB74258C3551F18'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: NetworkImage(
                      'https://t1.daumcdn.net/cfile/tistory/2160894258C3552019'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        heroTag: 'fashionInfo',
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              context: context,
                              builder: buildFashionInfoBottomSheet);
                        },
                        backgroundColor: Colors.red,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.tshirt,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        heroTag: 'like',
                        backgroundColor: Colors.yellow,
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.thumbsUp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        heroTag: 'share',
                        onPressed: () {},
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.shareAltSquare,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        heroTag: 'report',
                        onPressed: () {
                          showReportDialog(context);
                        },
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.fileSignature,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        heroTag: 'comments',
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              context: context,
                              builder: buildCommentBottomSheet);
                        },
                        backgroundColor: Colors.purple,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.comments,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
