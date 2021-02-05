package com.evildoer.admin.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.admin.model.entity.SysRole;

import java.util.List;

public interface ISysRoleService extends IService<SysRole> {

    boolean update(SysRole role);

    boolean delete(List<Long> ids);

    boolean add(SysRole role);

    boolean update(Long id, List<Long> permissionIds);
}
