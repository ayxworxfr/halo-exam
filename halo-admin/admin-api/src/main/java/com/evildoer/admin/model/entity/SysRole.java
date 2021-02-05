package com.evildoer.admin.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;

import java.util.List;

@Data
@TableName(value = "sys_role")
public class SysRole extends BaseEntity {

    @TableId(type= IdType.AUTO)
    private Long id;

    private String name;

    private Integer sort;

    private Integer status;

    private Integer deleted;

    @TableField(exist = false)
    private List<Long> menuIds;

    @TableField(exist = false)
    private List<Long> permissionIds;

}
