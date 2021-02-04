package com.evildoer.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evildoer.admin.model.entity.SysRolePermission;
import org.apache.ibatis.annotations.Select;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface SysRolePermissionMapper extends BaseMapper<SysRolePermission> {

    @Select("<script>" +
            "   select role_id from sys_role_permission where permission_id = #{permissionId} " +
            "</script>")
    List<Long> listByPermissionId(Long permissionId);

}
