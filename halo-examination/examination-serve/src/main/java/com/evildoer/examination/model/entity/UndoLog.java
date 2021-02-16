package com.evildoer.examination.model.entity;

import java.time.LocalDateTime;
import com.evildoer.common.core.base.BaseEntity;
import java.sql.Blob;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * AT transaction mode undo table
 * </p>
 *
 * @author evildoer
 * @since 2021-02-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class UndoLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * branch transaction id
     */
    private Long branchId;

    /**
     * global transaction id
     */
    private String xid;

    /**
     * undo_log context,such as serialization
     */
    private String context;

    /**
     * rollback info
     */
    private Blob rollbackInfo;

    /**
     * 0:normal status,1:defense status
     */
    private Integer logStatus;

    /**
     * create datetime
     */
    private LocalDateTime logCreated;

    /**
     * modify datetime
     */
    private LocalDateTime logModified;


}
