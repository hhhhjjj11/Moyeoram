
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youngjun/alarm/repository/add_friend_alarm_group_repository.dart';
import 'package:youngjun/friends/model/friends_list_model.dart';
import 'package:youngjun/friends/repository/friends_repository.dart';

AddFriendAlarmGroupViewModel _addFriendAlarmGroupViewModel = AddFriendAlarmGroupViewModel();
final addFriendAlarmProvider = ChangeNotifierProvider<AddFriendAlarmGroupViewModel>((ref) => _addFriendAlarmGroupViewModel );

final searchFriendProvider = FutureProvider<List<Friend>?>((ref) async {
  return await _addFriendAlarmGroupViewModel.searchFriend();
} );

class AddFriendAlarmGroupViewModel extends ChangeNotifier{
  // final List<int?> memberIds = [];
  // final List<String?> member = [];
  final List<MemberModel?> members = [];
  final AddFriendAlarmGroupRepository _addFriendAlarmGroupRepository = AddFriendAlarmGroupRepository();
  final List<int?> checkId = [];
  final FriendsRepository _friendsRepository = FriendsRepository(Dio());
  String friendNickname = '';

  clearMember(){
    members.clear();
  }

  setMember(int newMemberId, String newMemberNickname){
    if(!checkId.contains(newMemberId)){
      MemberModel newMember = MemberModel(
          nickname: newMemberNickname,
          memberId: newMemberId,
      );
      checkId.add(newMemberId);
      members.add(newMember);
    }
    notifyListeners();
  }

  setFriendNickname(String Nickname) {
    friendNickname = Nickname;
  }

  deleteMember(MemberModel member){
    if(checkId.contains(member.memberId)){
      checkId.remove(member.memberId);
      members.remove(member);
    }
    notifyListeners();
  }

  inviteFriend(int alarmGroupId, List<int?> memberIds) async {
    return await _addFriendAlarmGroupRepository.inviteFriend(alarmGroupId, memberIds);
  }

  Future<List<Friend>?> searchFriend() async {
    print("$friendNickname friend");
    var response =  await _friendsRepository.searchFriends(friendNickname);
    if(response.code == "200"){
      return response.data.friends;
    }
    return null;
  }
}

class MemberModel {
  final String nickname;
  final int memberId;

  MemberModel({
    required this.nickname,
    required this.memberId,
});
}