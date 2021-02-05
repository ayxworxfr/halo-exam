package com.evildoer.examination.model.entity;

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
public class ExamUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 报考用户id
     */
    private Long userId;

    /**
     * 考试id
     */
    private String examId;

    /**
     * 报考时间
     */
    private LocalDateTime signTime;

    /**
     * 提交答卷时间
     */
    private LocalDateTime finishTime;


}
