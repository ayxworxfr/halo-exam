package com.evildoer.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.evildoer.admin.model.entity.SysPermission;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    @Select(" select id,name,permission from sys_permission ")
    @Results({
            @Result(property = "roleIds", column = "id", many = @Many(select = "com.evildoer.admin.dao.SysRolePermissionMapper.listByPermissionId"))
    })
    List<SysPermission> listForPermissionRoles();

    @Select("<script>" +
            " SELECT " +
            " 	t1.*, t2.NAME AS menu_name  " +
            " FROM " +
            " 	sys_permission t1 " +
            " 	LEFT JOIN sys_menu t2 ON t1.menu_id = t2.id " +
            " WHERE 1=1 " +
            " <if test='permission.name != null and permission.name.trim() neq \"\"'>" +
            "   and a.name like concat('%',#{permission.name},'%')" +
            " </if>" +
            " <if test='permission.type !=null '>" +
            "   and t1.type = #{permission.type}" +
            " </if>" +
            " <if test='permission.menuId !=null '>" +
            "   and t1.menu_id = #{permission.menuId}" +
            " </if>" +
            " ORDER BY t1.gmt_modified DESC,t1.gmt_create DESC" +
            "</script>")
    List<SysPermission> list(Page<SysPermission> page, SysPermission permission);
}
