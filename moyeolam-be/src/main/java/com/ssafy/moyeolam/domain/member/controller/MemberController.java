package com.ssafy.moyeolam.domain.member.controller;

import com.ssafy.moyeolam.domain.auth.dto.PrincipalDetails;
import com.ssafy.moyeolam.domain.member.domain.Member;
import com.ssafy.moyeolam.domain.member.dto.*;
import com.ssafy.moyeolam.domain.member.exception.MemberErrorInfo;
import com.ssafy.moyeolam.domain.member.exception.MemberException;
import com.ssafy.moyeolam.domain.member.service.MemberService;
import com.ssafy.moyeolam.global.common.response.EnvelopeResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/profileImage")
    public EnvelopeResponse<UploadProfileImageResponseDto> uploadProfileImage(@AuthenticationPrincipal PrincipalDetails principal, @RequestBody UploadProfileImageRequestDto uploadProfileImageRequestDto) throws IOException {

        Member member = principal.getMember();

        return EnvelopeResponse.<UploadProfileImageResponseDto>builder()
                .data(memberService.uploadProfileImage(member, uploadProfileImageRequestDto))
                .build();
    }

    @DeleteMapping("/profileImage")
    public EnvelopeResponse<Long> deleteProfileImage(@AuthenticationPrincipal PrincipalDetails principal) {

        Member member = principal.getMember();

        return EnvelopeResponse.<Long>builder()
                .data(memberService.deleteProfileImage(member))
                .build();
    }

    @PostMapping("/nickname")
    public EnvelopeResponse<Long> saveNickname(@AuthenticationPrincipal PrincipalDetails principal, @RequestBody SaveNicknameRequestDto saveNicknameRequestDto) {

        if (principal == null) {
            throw new MemberException(MemberErrorInfo.NOT_FOUND_MEMBER);
        }

        Member member = principal.getMember();

        return EnvelopeResponse.<Long>builder()
                .data(memberService.saveNickname(member, saveNicknameRequestDto))
                .build();
    }

    @GetMapping()
    public EnvelopeResponse<SearchMembereResponseDto> searchMember(@AuthenticationPrincipal PrincipalDetails principal, @RequestParam String keyword) {
//        if (principal == null) {
//            throw new MemberException(MemberErrorInfo.NOT_FOUND_MEMBER);
//        }
        AuthenticatedMember member = AuthenticatedMember.builder()
                .memberId(1L)
                .build();

        return EnvelopeResponse.<SearchMembereResponseDto>builder()
                .data(memberService.searchMember(member.getMemberId(), keyword))
                .build();

    }

    @DeleteMapping()
    public EnvelopeResponse<Long> deleteMember(@AuthenticationPrincipal PrincipalDetails principal) {

        Member member = principal.getMember();

        return EnvelopeResponse.<Long>builder()
                .data(memberService.deleteMember(member))
                .build();
    }

    @GetMapping("/settings")
    public EnvelopeResponse<FindMemberSettingResponseDto> findMemberSetting(@AuthenticationPrincipal PrincipalDetails principalDetails) {
//        if (principalDetails == null) {
//            throw new MemberException(MemberErrorInfo.NOT_FOUND_MEMBER);
//        }
        AuthenticatedMember member = AuthenticatedMember.builder()
                .memberId(1L)
                .build();

        return EnvelopeResponse.<FindMemberSettingResponseDto>builder()
                .data(memberService.findMemberSetting(member.getMemberId()))
                .build();
    }

    @PatchMapping("/settings/notification-toggle")
    public EnvelopeResponse<Boolean> toggleMemberNotification(@AuthenticationPrincipal PrincipalDetails principalDetails) {
//        if (principalDetails == null) {
//            throw new MemberException(MemberErrorInfo.NOT_FOUND_MEMBER);
//        }
        AuthenticatedMember member = AuthenticatedMember.builder()
                .memberId(1L)
                .build();

        return EnvelopeResponse.<Boolean>builder()
                .data(memberService.toggleMemberNotification(member.getMemberId()))
                .build();
    }
}
