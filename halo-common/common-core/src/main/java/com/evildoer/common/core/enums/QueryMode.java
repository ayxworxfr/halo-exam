package com.evildoer.common.core.enums;

import lombok.Getter;
import lombok.Setter;

public enum QueryMode {

    PAGE("page", "分页查询"),
    LIST("list","列表查询"),
    TREE("tree","树形列表"),
    CASCADER("cascader","级联列表"), // 对应级联选择器的下拉格式数据
    ROUTER("router","路由列表"),
    TREESELECT("treeselect","树形下拉列表")
    ;

    @Getter
    @Setter
    private String code;

    QueryMode(String code, String desc) {
        this.code=code;
    }

    public static QueryMode getValue(String code){
        for (QueryMode value : values()) {
            if (value.getCode().equals(code)) {
                return value;
            }
        }
        return null; // 默认分页
    }

}
