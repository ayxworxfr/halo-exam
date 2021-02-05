package com.evildoer.common.core.mode.entity;

import java.math.BigDecimal;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * VIEW
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ExamDetail extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 考试id
     */
    private String examId;

    private Long peoples;

    private Long score;

    private BigDecimal markScore;


}
