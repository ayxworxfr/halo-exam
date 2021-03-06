package com.evildoer.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evildoer.admin.model.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Select;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

    @Select("<script>" +
            "  select role_id from sys_role_menu where menu_id=#{menuId} " +
            "</script>")
    List<Integer> listByMenuId(Integer menuId);
}
