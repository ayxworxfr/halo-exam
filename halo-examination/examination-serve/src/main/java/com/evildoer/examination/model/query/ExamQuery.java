package com.evildoer.examination.model.query;

import com.evildoer.common.core.base.BasePage;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author: evildoer
 * @datetime: 2021/2/16 14:32
 */
@Data
public class ExamQuery extends BasePage {

    @ApiModelProperty(value = "试卷标题", example = "exam")
    private String title;

    @ApiModelProperty(value = "是否发布(0-否, 1-是)", example = "1")
    private Integer publish;
}
