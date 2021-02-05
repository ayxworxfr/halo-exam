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
public class Subject extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 科目名称
     */
    private String name;

    /**
     * 排序
     */
    private Integer sort;


}
