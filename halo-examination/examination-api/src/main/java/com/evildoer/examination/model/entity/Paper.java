package com.evildoer.examination.model.entity;

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
public class Paper extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 试卷名称
     */
    private String name;

    /**
     * 开始时间
     */
    private String startTime;

    /**
     * 结束时间
     */
    private String endTime;

    /**
     * 学科id
     */
    private Long subjectId;

    /**
     * 是否发布@1是，0否
     */
    private Integer publish;

    /**
     * 1-模考 2-正考
     */
    private Integer type;

    private String remark;

    private String avatar;

    /**
     * 参与人数
     */
    private String peoples;

    /**
     * 试卷标签(多个标签用&分隔)
     */
    private String label;

    /**
     * 试卷热度
     */
    private Long heat;

    /**
     * 试卷状态 1-公开(默认) 2私有
     */
    private Integer status;

    private Long createBy;

    private Long updateBy;
}
