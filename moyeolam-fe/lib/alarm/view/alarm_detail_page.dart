import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:youngjun/alarm/view/add_friend_alarm_group_view.dart';
import 'package:youngjun/alarm/viewmodel/add_alarm_group_view_model.dart';
import 'package:youngjun/alarm/viewmodel/add_friend_alarm_group_view_model.dart';
import 'package:youngjun/alarm/viewmodel/alarm_detail_view_model.dart';
import 'package:youngjun/common/button/btn_back.dart';

import 'package:youngjun/common/button/btn_save_update.dart';
import 'package:youngjun/common/const/colors.dart';
import 'package:youngjun/common/layout/title_bar.dart';
import 'package:youngjun/alarm/component/alarm_guest_list.dart';
import 'package:youngjun/alarm/model/alarm_detail_model.dart';
import 'package:youngjun/alarm/view/alarm_add_page.dart';
import 'package:youngjun/main/view/main_page.dart';


class AlarmDetailScreen extends ConsumerStatefulWidget {
  const AlarmDetailScreen({
    super.key,
  });

  @override
  ConsumerState<AlarmDetailScreen> createState() => _AlarmDetailScreenState();
}

class _AlarmDetailScreenState extends ConsumerState<AlarmDetailScreen> {


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      ref.invalidate(alarmDetailFutureProvider);
    });
    var alarmGroup = ref.watch(alarmDetailFutureProvider);
    return alarmGroup.when(
      data: (data) {
        if (data != null) {
          return Scaffold(
            backgroundColor: BACKGROUND_COLOR,
            appBar: TitleBar(
              title: data.title ?? '알람그룹',
              appBar: AppBar(),
              leading: BtnBack(onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()));
                // Navigator.of(context).pop();
              }),
              actions: [
                data.isHost ?
                BtnSaveUpdate(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                AlarmAddScreen(
                                  detailAlarmGroup: data,
                                )
                        )
                    )
                        .then((value) =>
                        setState(() {
                          ref.invalidate(alarmDetailFutureProvider);
                        }
                        )
                    );
                  },
                  text: "수정",
                ) : BtnSaveUpdate(
                  onPressed: () {},
                  text: "나가기",
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(alarmDetailFutureProvider);
              },
              child: Column(
                  children: [
                    SizedBox(height: 24),
                    // Clock(timeSet: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, data.hour, data.minute)),

                    Flexible(
                      child: Container(
                        height: 144,
                        alignment: Alignment.center,
                        child: Text(
                            (data.hour % 12)
                                .toString()
                                .length == 1 && data.minute
                                .toString()
                                .length == 2 ?
                            "0${data.hour % 12} : ${data.minute}   ${data.hour >=
                                12 ? "PM" : "AM"}" :
                            (data.hour % 12)
                                .toString()
                                .length == 2 && data.minute
                                .toString()
                                .length == 1 ?
                            "${data.hour % 12} : 0${data.minute}   ${data.hour >=
                                12 ? "PM" : "AM"}" :
                            (data.hour % 12)
                                .toString()
                                .length == 1 && data.minute
                                .toString()
                                .length == 1 ?
                            "0${data.hour % 12} : 0${data.minute}   ${data.hour >=
                                12 ? "PM" : "AM"}" :
                            "${data.hour % 12} : ${data.minute}   ${data.hour >=
                                12 ? "PM" : "AM"}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: FONT_COLOR,
                              fontSize: 44,

                            )),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    '알림음',
                                    style: TextStyle(
                                      color: FONT_COLOR,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: 180,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            data.alarmSound,
                                            style: TextStyle(
                                              color: FONT_COLOR,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(width: 12,),
                                          Icon(
                                            Icons.arrow_right_sharp,
                                            color: FONT_COLOR,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      width: 60,
                                    ),
                                  ),
                                  Text(
                                    '인증방식',
                                    style: TextStyle(
                                      color: FONT_COLOR,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // Flexible(
                                  //   child: SizedBox(
                                  //     width: 100,
                                  //   ),
                                  // ),
                                  Flexible(
                                    child: Container(
                                      width: 180,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            data.alarmMission,
                                            style: TextStyle(
                                              color: FONT_COLOR,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Icon(
                                            Icons.arrow_right_sharp,
                                            color: FONT_COLOR,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),

                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: 60,
                                  ),
                                ),
                                Text(
                                  '반복 요일',
                                  style: TextStyle(
                                    color: FONT_COLOR,
                                    fontSize: 20,
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 72,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 180,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        for (int index = 0; index < 7; index++)
                                          if(data.dayOfWeek[index])
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 4),
                                              child: Text(
                                                week[index],
                                                style: TextStyle(
                                                  color: FONT_COLOR,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Flexible(child: SizedBox(height: 24,)),
                          ],
                        ),
                      ),
                    ),

                    Text(
                      '참여목록',
                      style: TextStyle(
                        fontSize: 20,
                        color: FONT_COLOR,
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 24,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        // color: FONT_COLOR,
                        // alignment: Alignment.center,
                        width: 360,
                        height: 360,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: (150 / 92),
                          children: [
                            for(int index = 0; index <
                                data.members.length; index++)
                              Flexible(
                                child: AlarmGuestList(
                                  color: data.members[index].toggle? MAIN_COLOR:CKECK_GRAY_COLOR,
                                  nickname: data.members[index].nickname,
                                  profileImage: Image.network(
                                      "${data.members[index].profileUrl}") ??
                                      Image.asset("assets/images/moyeolam"),
                                ),
                              ),
                            if(data.members.length < 6)
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    List<MemberModel?> members = [];

                                    for (int index = 0; index <
                                        data.members.length; index++) {
                                      MemberModel member = MemberModel(
                                          nickname: data.members[index].nickname,
                                          memberId: data.members[index].memberId);
                                      members.add(member);
                                    }
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            AddFriendAlarmGroupView(
                                              alarmGroupId: data.alarmGroupId,
                                              invitedMember: members,
                                            )));
                                  },
                                  child: Flexible(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: BorderSide(
                                            width: 3,
                                            color: MAIN_COLOR,
                                            style: BorderStyle.solid
                                        ),
                                      ),
                                      color: BACKGROUND_COLOR,
                                      child: Center(
                                        child: Icon(Icons.add,
                                          color: MAIN_COLOR,
                                          size: 20,),
                                      ),
                                    ),
                                  ),
                                ),
                              )


                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          );
        } else {
          print("Error: detail Data is null");
          return const SpinKitFadingCube(
            // FadingCube 모양 사용
            color: Colors.blue, // 색상 설정
            size: 50.0, // 크기 설정
            duration: Duration(seconds: 2), //속도 설정
          );
        }
      },
      error: (error, stackTrace) {
        print("Error: getDetails Error $error");
        return const SpinKitFadingCube(
          // FadingCube 모양 사용
          color: Colors.blue, // 색상 설정
          size: 50.0, // 크기 설정
          duration: Duration(seconds: 2), //속도 설정
        );
      },
      loading: () {
        return const SpinKitFadingCube(
          // FadingCube 모양 사용
          color: Colors.blue, // 색상 설정
          size: 50.0, // 크기 설정
          duration: Duration(seconds: 2), //속도 설정
        );
      },
    );
  }
}
      
