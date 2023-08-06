package com.ssafy.moyeolam.domain.auth.dto;

import com.ssafy.moyeolam.domain.alarmgroup.domain.AlarmGroupMember;
import com.ssafy.moyeolam.domain.alarmgroup.dto.AlarmGroupsElement;
import com.ssafy.moyeolam.domain.friend.domain.Friend;
import com.ssafy.moyeolam.domain.friend.dto.FriendElement;
import com.ssafy.moyeolam.domain.member.domain.Member;
import com.ssafy.moyeolam.domain.member.domain.ProfileImage;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
public class LoginResponseDto {

    private String nickname;
    private String profileImageUrl;
    private List<FriendElement> friends;
    private List<AlarmGroupsElement> alarmGroups;
    private String accessToken;
    private String refreshToken;

    public static LoginResponseDto of(Member member, ProfileImage profileImage, List<Friend> friends, List<AlarmGroupMember> alarmGroupMembers, String accessToken, String refreshToken){

        return LoginResponseDto.builder()
                .nickname(member.getNickname())
                .profileImageUrl(profileImage.getImageUrl())
                .friends(friends.stream()
                        .map(FriendElement::from)
                        .collect(Collectors.toList()))
                .alarmGroups(alarmGroupMembers.stream()
                        .map(AlarmGroupsElement::of)
                        .collect(Collectors.toList()))
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .build();
    }

}