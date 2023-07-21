package com.ssafy.moyeolam.domain.alarmgroup.exception;

import lombok.Getter;

@Getter
public enum AlarmGroupErrorInfo {
    UNAUTHORIZED_ACCESS("801","알람그룹 접근 권한이 없습니다."),
    NOT_FOUND_ALARM_GROUP("802", "존재하지 않는 알람그룹입니다.");


    private String code;
    private String message;

    AlarmGroupErrorInfo(String code, String message){
        this.code = code;
        this.message = message;
    }
}
