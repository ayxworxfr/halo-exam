package com.evildoer.admin.service;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evildoer.admin.model.entity.SysDept;
import com.evildoer.admin.model.vo.DeptVO;
import com.evildoer.admin.model.vo.TreeSelectVO;

import java.util.List;

public interface ISysDeptService extends IService<SysDept> {

    List<DeptVO> listForTree(LambdaQueryWrapper<SysDept> baseQuery);

    List<TreeSelectVO> listForTreeSelect(LambdaQueryWrapper<SysDept> baseQuery);
}
