package com.evildoer.question.model.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class AnswerQuestion extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String answer;

    /**
     * 得分
     */
    private BigDecimal markScore;

    /**
     * 问题id
     */
    private String questionId;

    /**
     * 答题时间点
     */
    private LocalDateTime answerTime;

    /**
     * 考试用户表id
     */
    private String examUserId;


}
