package com.evildoer.question.model.query;

import com.evildoer.common.core.base.BasePage;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description:
 * @author: evildoer
 * @datetime: 2021/2/16 14:32
 */
@Data
public class QuestionQuery extends BasePage {

    @ApiModelProperty(value = "问题状态 1-公开(默认) 2私有", example = "question")
    private Integer status;

    @ApiModelProperty(value = "问题标题", example = "question")
    private String title;
}
