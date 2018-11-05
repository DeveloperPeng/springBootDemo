package com.wp.manager.controller;

import com.wp.manager.bean.user.User;
import com.wp.manager.core.controller.AbstractController;
import com.wp.manager.form.user.UserForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Objects;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;
import static com.wp.manager.core.constants.GlobalConstants.USER_SESSION_ID;

/**
 * @author wp
 * @since 2018/9/11 14:22
 */
@Controller
@RequestMapping("/signin")
@SessionAttributes(KAPTCHA_SESSION_KEY)
public class SigninController extends AbstractController {

    @RequestMapping(method = RequestMethod.GET)
    public String signin(@ModelAttribute UserForm userForm, ModelMap modelMap) {
        if (modelMap.containsKey(BINDING_RESULT_KEY)) {
            modelMap.addAttribute(BindingResult.class.getName().concat(".userForm"), modelMap.get(BINDING_RESULT_KEY));
        }
        if (Objects.isNull(userForm.getUser())) {
            userForm.setUser(new User());
        }
        return "signin";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String signin(UserForm userForm, @ModelAttribute(KAPTCHA_SESSION_KEY) String captchaExpected, BindingResult result, RedirectAttributes redirectAttributes, HttpSession httpSession) {

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute(BINDING_RESULT_KEY, result.getAllErrors());
            redirectAttributes.addFlashAttribute(userForm);
            return "redirect:/signin";
        }

        if (!"123".equals(userForm.getUser().getUsername()) || !"123".equals(userForm.getUser().getPassword())) {
            logger.error("用户名或密码不正确");
            result.addError(new ObjectError("userInfo","用户名或密码不正确"));
            redirectAttributes.addFlashAttribute(userForm);
            redirectAttributes.addFlashAttribute(BINDING_RESULT_KEY, result.getAllErrors());
            return "redirect:/signin";
        }

        if (!captchaExpected.equals(userForm.getCaptcha())) {
            logger.error("验证码不正确");
            result.addError(new ObjectError("captcha","验证码不正确"));
            redirectAttributes.addFlashAttribute(userForm);
            redirectAttributes.addFlashAttribute(BINDING_RESULT_KEY, result.getAllErrors());
            return "redirect:/signin";
        }

        httpSession.setAttribute(USER_SESSION_ID, "1");

        return "redirect:/dashboard";
    }
}
