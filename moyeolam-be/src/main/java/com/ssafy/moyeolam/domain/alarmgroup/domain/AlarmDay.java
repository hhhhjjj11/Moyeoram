package com.ssafy.moyeolam.domain.alarmgroup.domain;

import com.ssafy.moyeolam.domain.meta.converter.DayOfWeekConverter;
import com.ssafy.moyeolam.domain.meta.domain.MetaData;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity(name = "alarm_day")
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AlarmDay {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "alarm_day_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "alarm_group_id")
    private AlarmGroup alarmGroup;

    @Convert(converter = DayOfWeekConverter.class)
    private MetaData dayOfWeek;
}
