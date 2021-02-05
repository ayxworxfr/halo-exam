package com.evildoer.common.core.mode.entity;

import java.math.BigDecimal;
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
public class QuestionAnswer extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 问题id
     */
    private String questionId;

    /**
     * 问题正确答案(如果是多选题包含分值分配方式)
     */
    private String answer;

    /**
     * 问题解析
     */
    private String analysis;

    /**
     * 出题人设置的题目分值
     */
    private BigDecimal score;


}
