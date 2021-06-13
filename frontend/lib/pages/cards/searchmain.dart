import 'package:team_up/commons/constData.dart';
import 'package:team_up/commons/userProfileCommon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import '../../const.dart';

class Cards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchMain();
}

class _SearchMain extends State<Cards>
    with
        userProfileCommon,
        WidgetsBindingObserver,
        AutomaticKeepAliveClientMixin<Cards> {
  @override
  bool get wantKeepAlive => true;

  bool _isLike;
  int _currentIndex = 0;
  double _xPosition = 0.0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return dummyUserDataListInSearch.length == _currentIndex
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  color: Color(0xFFE5E5E5),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF16FF00),
                        Color(0xFF4CFFC9),
                      ],
                    ),
                  ),
                ),
                appBar(),
                Center(child: Text('Предложений больше нет!')),
              ],
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  color: Color(0xFFE5E5E5),
                ),
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF16FF00),
                        Color(0xFF4CFFC9),
                      ],
                    ),
                  ),
                ),
                appBar(),
                cards(size),
              ],
            ),
          );
  }

  Widget cards(size) => Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 14.0),
                    blurRadius: 15.0,
                    color: Color(0x420C9E18),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.85,
              child: TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: dummyUserDataListInSearch.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * 0.85,
                minWidth: MediaQuery.of(context).size.width * 0.84,
                minHeight: MediaQuery.of(context).size.height * 0.7,
                cardController: cardController,
                cardBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      PageView(
                        controller: _pageController =
                            PageController(initialPage: 0),
                        children: _userProfile(size, index),
                        scrollDirection: Axis.vertical,
                      ),
                      Positioned(
                        top: 54,
                        right: 36,
                        child: _isLike != null &&
                                !_isLike &&
                                index == _currentIndex
                            ? _likeOrDislikeIconOnPhoto(
                                FontAwesomeIcons.ban, Colors.redAccent)
                            : Container(),
                      ),
                      Positioned(
                        top: 50,
                        left: 40,
                        child:
                            _isLike != null && _isLike && index == _currentIndex
                                ? _likeOrDislikeIconOnPhoto(
                                    FontAwesomeIcons.thumbsUp, Colors.green)
                                : Container(),
                      )
                    ],
                  );
                },
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  if (align.x < 0) {
                    //Card is LEFT swiping
                    if (align.x < -3) {
                      _isLike = false;
                    }
                    if (-(align.x * 0.1) > 1) {
                      _xPosition = 1;
                    } else {
                      _xPosition = -(align.x * 0.1);
                    }
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                    if (align.x > 3) {
                      _isLike = true;
                    }
                    if ((align.x * 0.1) > 1) {
                      _xPosition = 1;
                    } else {
                      _xPosition = (align.x * 0.1);
                    }
                  } else {
                    _xPosition = 0;
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  print('orientation is $orientation and index is $index');
                  if (orientation == CardSwipeOrientation.LEFT ||
                      orientation == CardSwipeOrientation.RIGHT) {
                    setState(() {
                      _currentIndex = index + 1;
                    });
                    _pageController.jumpToPage(0);
                  }
                  _isLike = null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => cardController.triggerLeft(),
                  child: Image.asset('images/discard_card.png'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => cardController.triggerUp(),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0.0),
                    ),
                  ),
                  child: Image.asset('images/like_card.png'),
                ),
                TextButton(
                  onPressed: () => cardController.triggerRight(),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0.0),
                    ),
                  ),
                  child: Image.asset('images/add_card.png'),
                ),
              ],
            ),
          )
        ],
      );

  Widget appBar() {
    return Positioned(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.filter_list_alt,
                color: Colors.black,
              ),
            ),
            Text(
              'Карточки',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 24,
                color: Color(0xFF333333),
              ).copyWith(fontFamily: Fonts().regular),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.favorite, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _likeOrDislikeIconOnPhoto(IconData icon, Color iconColor) {
    return AnimatedOpacity(
      opacity: _xPosition,
      duration: Duration(milliseconds: 500),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 1.0,
              top: 2.0,
              child: FaIcon(
                icon,
                color: Colors.black54,
                size: 76,
              )),
          FaIcon(
            icon,
            color: iconColor,
            size: 76,
          )
        ],
      ),
    );
  }

  List<Widget> _userProfile(
    Size size,
    int index,
  ) {
    List<Widget> _returnWidgetList = [];
    //dummyUserDataListInSearch[index].userImages.length
    for (int i = 0; i < 1; i++) {
      Widget _userWidget = Stack(
        children: [
          GestureDetector(
            child: ClipRRect(
              child: Container(
                height: size.height,
                width: size.width - 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(16)),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 190,
                          child: Text(
                            'UnderGround',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xFF333333),
                            ).copyWith(fontFamily: Fonts().light),
                          ),
                        ),
                        Text(
                          'Россия, Ярославль',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xFF333333),
                          ).copyWith(fontFamily: Fonts().light),
                        ),
                        Text(
                          'Стартап',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xFF333333),
                          ).copyWith(fontFamily: Fonts().light),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: Text(
                    'О нас',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ).copyWith(fontFamily: Fonts().regular),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Мы команда UnderGround! Участники и победители множества хакатонов. ",
                              style: TextStyle()
                                  .copyWith(fontFamily: Fonts().regular),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: Text(
                    'Достижения',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ).copyWith(fontFamily: Fonts().regular),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.00,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "2-е региональное и 4-е федеральное место хакатона 'Цифровой прорыв'. Первое региональное место хакатона 'ТехноХакатон'",
                              style: TextStyle()
                                  .copyWith(fontFamily: Fonts().regular),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: Text(
                    'Проекты',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ).copyWith(fontFamily: Fonts().regular),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        projectList(),
                        SizedBox(width: 5),
                        projectList(),
                        SizedBox(width: 5),
                        projectList(),
                        SizedBox(width: 5),
                        SizedBox(width: 5),
                        projectList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 30,
            child: ScrollingPageIndicator(
              dotColor: Colors.white,
              dotSelectedColor: Colors.green,
              dotSize: 6,
              dotSelectedSize: 10,
              dotSpacing: 16,
              controller: _pageController,
              itemCount: dummyUserDataListInSearch[index].userImages.length,
              orientation: Axis.vertical,
            ),
          ),
        ],
      );
      _returnWidgetList.add(_userWidget);
    }
    return _returnWidgetList;
  }

  Widget projectList() {
    return InkWell(
      onTap: () {
        print("popo");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 150,
          height: 110,
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 70,
              ),
              Container(
                color: Colors.green,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
