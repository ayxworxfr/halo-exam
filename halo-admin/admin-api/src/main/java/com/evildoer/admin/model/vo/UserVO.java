package com.evildoer.admin.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class UserVO {

    private Long id;

    private String nickname;

    private String avatar;

    private List<Long> roles;

}
