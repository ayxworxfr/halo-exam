package com.evildoer.examination.model.vo;

import com.evildoer.examination.model.entity.Exam;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @description:
 * @author: evildoer
 * @datetime: 2021/2/16 14:19
 */
@Data
@Accessors(chain = true)
public class ExamVo extends Exam {

    //private String value;
    //
    //private String label;
    //
    //@JsonInclude(JsonInclude.Include.NON_EMPTY)
    //private List<ExamVo> children;
}
