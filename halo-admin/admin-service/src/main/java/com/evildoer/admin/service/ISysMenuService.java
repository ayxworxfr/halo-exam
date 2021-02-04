package com.evildoer.admin.service;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.admin.model.entity.SysMenu;
import com.evildoer.admin.model.vo.MenuVO;
import com.evildoer.admin.model.vo.TreeSelectVO;

import java.util.List;

/**
 * @author haoxr
 * @date 2020-11-06
 */
public interface ISysMenuService extends IService<SysMenu> {

    List<MenuVO> listForTree(LambdaQueryWrapper<SysMenu> baseQuery);

    List<TreeSelectVO> listForTreeSelect(LambdaQueryWrapper<SysMenu> baseQuery);

    List listForRouter();
}
