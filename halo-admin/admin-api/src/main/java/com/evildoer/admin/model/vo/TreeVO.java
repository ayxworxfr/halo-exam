package com.evildoer.admin.model.vo;


import lombok.Data;

import java.util.List;

@Data
public class TreeVO {

    private Long id;

    private String label;

    private List<TreeVO> children;

}
