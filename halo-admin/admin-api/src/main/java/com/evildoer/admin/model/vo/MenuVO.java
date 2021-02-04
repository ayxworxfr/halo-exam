package com.evildoer.admin.model.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.evildoer.common.core.base.BaseEntity;
import lombok.Data;

import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class MenuVO extends BaseEntity {

    private Long id;

    private Long parentId;

    private String name;

    private String icon;

    private String path;

    private String component;

    private Integer sort;

    private Integer visible;

    private String redirect;

    @JsonInclude(value = JsonInclude.Include.NON_NULL)
    private List<MenuVO> children;

}
