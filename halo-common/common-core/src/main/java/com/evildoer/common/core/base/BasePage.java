package com.evildoer.common.core.base;

import com.evildoer.common.core.enums.QueryMode;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @description: PageBase
 * @author: evildoer
 * @datetime: 2021/1/26 10:05
 */
@Data
public class BasePage implements Serializable {

    private static final long serialVersionUID = -4869594085374385813L;

    /**
     * 总数
     */
    @ApiModelProperty(value = "总数", hidden = true, example = "0")
    private long total = 0;
    /**
     * 每页显示条数，默认 10
     */
    @ApiModelProperty(value = "每页显示条数", hidden = true, example = "10")
    private Integer pageSize = 10;

    /**
     * 当前页
     */
    @ApiModelProperty(value = "当前页", hidden = true, example = "1")
    private Integer page = 1;

    /**
     * 查询模式
     * PAGE("page", "分页查询")
     * LIST("list","列表查询")
     * TREE("tree","树形列表")
     * CASCADER("cascader","级联列表")
     * ROUTER("router","路由列表")
     * TREESELECT("treeselect","树形下拉列表")
     */
    @ApiModelProperty(value = "查询模式", hidden = true, example = "page")
    private String queryMode = QueryMode.PAGE.getCode();
}
