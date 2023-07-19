package com.ssafy.moyeolam.domain.meta.converter;

import com.ssafy.moyeolam.domain.meta.domain.MetaDataType;
import com.ssafy.moyeolam.domain.meta.service.MetaDataService;

import javax.persistence.Convert;

@Convert
public class AlarmMissionConverter extends BaseConverter {
    public AlarmMissionConverter(MetaDataService metaDataService) {
        super(metaDataService, MetaDataType.ALARM_MISSION.name());
    }
}
