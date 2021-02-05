package com.evildoer.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evildoer.admin.dao.SysPermissionMapper;
import com.evildoer.admin.model.entity.SysPermission;
import com.evildoer.admin.model.vo.TreeVO;
import com.evildoer.admin.service.ISysPermissionService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

    @Override
    public List<SysPermission> listForPermissionRoles() {
        return this.baseMapper.listForPermissionRoles();
    }

    @Override
    public List<TreeVO> listForTree(LambdaQueryWrapper<SysPermission> baseQuery) {
        List<TreeVO> list = new ArrayList<>();
        List<SysPermission> resources = this.list(baseQuery);
        Optional.ofNullable(resources).orElse(new ArrayList<>()).forEach(item -> {
            TreeVO treeVO = new TreeVO();
            treeVO.setId(item.getId());
            treeVO.setLabel(item.getName() + "：" + item.getPermission());
            list.add(treeVO);
        });
        return list;
    }

    @Override
    public  IPage<SysPermission> list(Page<SysPermission> page, SysPermission permission) {
        List<SysPermission> list = this.baseMapper.list(page,permission);
        page.setRecords(list);
        return page;
    }
}
