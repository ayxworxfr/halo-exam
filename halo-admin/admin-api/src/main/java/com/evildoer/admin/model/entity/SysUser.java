package com.evildoer.admin.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;

import java.util.List;


@Data
public class SysUser extends BaseEntity {

    @TableId
    private Long id;

    private String username;

    private String nickname;

    private String mobile;

    private Integer gender;

    private String avatar;

    private String password;

    private Integer status;

    private Long deptId;

    private Integer deleted;

    @TableField(exist = false)
    private String deptName;

    @TableField(exist = false)
    private List<Long> roleIds;

    @TableField(exist = false)
    private String roleNames;

}
