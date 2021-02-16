package com.evildoer.question.model.entity;

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
public class Question extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 题目类型 1-选择题 2-多选题 3-填空题 4-简答题
     */
    private Integer type;

    /**
     * 题目标题
     */
    private String title;

    /**
     * 题目描述
     */
    private String description;

    /**
     * 题目难度权重0~1
     */
    private BigDecimal weight;

    /**
     * 题目内容(扩展用)
     */
    private String content;

    private String optionA;

    private String optionB;

    private String optionC;

    private String optionD;

    /**
     * 题目标签(多个标签用&分隔)
     */
    private String label;

    /**
     * 题目热度
     */
    private Long heat;

    /**
     * 问题状态 1-公开(默认) 2私有
     */
    private Integer status;

    private Long createBy;

    private Long updateBy;


}
