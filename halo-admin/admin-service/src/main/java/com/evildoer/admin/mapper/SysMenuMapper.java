package com.evildoer.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evildoer.admin.model.entity.SysMenu;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.mapstruct.Mapper;

import java.util.List;

/**
 * @author haoxr
 * @date 2020-11-06
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    @Select("<script>" +
            "   select id,name,parent_id,path,component,icon,sort,visible from sys_menu_test " +
            "   where visible=1" +
            "   order by sort asc" +
            "</script>")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            // 一对多关联查询拥有菜单访问权限的角色ID集合
            @Result(property = "roles", column = "id", many = @Many(select = "com.evildoer.admin.mapper.SysRoleMenuMapper.listByMenuId"))
    })
    List<SysMenu> listForRouter();
}
