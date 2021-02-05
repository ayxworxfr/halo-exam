package com.evildoer.admin.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.admin.model.entity.SysPermission;
import com.evildoer.admin.model.vo.TreeVO;

import java.util.List;

public interface ISysPermissionService extends IService<SysPermission> {

    List<SysPermission> listForPermissionRoles();

    List<TreeVO> listForTree(LambdaQueryWrapper<SysPermission> baseQuery);

    IPage<SysPermission> list(Page<SysPermission> page, SysPermission permission);
}
