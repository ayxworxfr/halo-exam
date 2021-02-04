package com.evildoer.admin.api;

import com.evildoer.admin.model.dto.UserDTO;
import com.evildoer.common.core.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(value = "halo-admin")
public interface UserFeignService {

    @GetMapping("/api.admin/v1/users/username/{username}")
    Result<UserDTO> getUserByUsername(@PathVariable String username);
}
