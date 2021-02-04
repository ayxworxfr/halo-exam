package com.evildoer.auth.service;

import com.evildoer.admin.api.UserFeignService ;
import com.evildoer.admin.model.dto.UserDTO;
import com.evildoer.auth.domain.User;
import com.evildoer.common.core.constant.AuthConstants;
import com.evildoer.common.core.result.Result;
import com.evildoer.common.core.result.ResultCode;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;


/**
 * 自定义用户认证和授权
 */
@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private UserFeignService userFeignService;

    //private MemberFeignService memberFeignService;

    private HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        String clientId = request.getParameter(AuthConstants.JWT_CLIENT_ID_KEY);
        User user = null;
        switch (clientId) {
            // 后台用户
            case AuthConstants.ADMIN_CLIENT_ID:
                Result<UserDTO> userRes = userFeignService.getUserByUsername(username);
                if (ResultCode.USER_NOT_EXIST.getCode().equals(userRes.getCode())) {
                    throw new UsernameNotFoundException(ResultCode.USER_NOT_EXIST.getMsg());
                }
                UserDTO userDTO = userRes.getData();
                userDTO.setClientId(clientId);
                user = new User(userDTO);
                break;
            //case AuthConstants.WEAPP_CLIENT_ID: // 小程序会员
            //    Result<AuthMemberDTO> memberRes = memberFeignService.getUserByOpenid(username);
            //    if (ResultCode.USER_NOT_EXIST.getCode().equals(memberRes.getCode())) {
            //        throw new UsernameNotFoundException(ResultCode.USER_NOT_EXIST.getMsg());
            //    }
            //    AuthMemberDTO authMemberDTO = memberRes.getData();
            //    authMemberDTO.setClientId(clientId);
            //    user = new User(authMemberDTO);
            //    break;
            default:
                break;
        }
        if (!user.isEnabled()) {
            throw new DisabledException("该账户已被禁用!");
        } else if (!user.isAccountNonLocked()) {
            throw new LockedException("该账号已被锁定!");
        } else if (!user.isAccountNonExpired()) {
            throw new AccountExpiredException("该账号已过期!");
        }
        return user;
    }

}
