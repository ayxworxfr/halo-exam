package com.evildoer.common.core.mode.entity;

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
public class SysClass extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 班级名称
     */
    private String name;

    private Long gradeId;

}
