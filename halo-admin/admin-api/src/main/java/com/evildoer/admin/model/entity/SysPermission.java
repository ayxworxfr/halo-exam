package com.evildoer.admin.model.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Accessors(chain = true)
public class SysPermission extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String permission;
    private Long menuId;
    private Integer type;

    // 拥有资源权限角色ID集合
    @TableField(exist = false)
    private List<Long> roleIds;
}
