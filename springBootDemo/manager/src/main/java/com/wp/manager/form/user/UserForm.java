package com.wp.manager.form.user;

import com.wp.manager.bean.user.User;
import com.wp.manager.core.form.AbstractForm;

/**
 * @author wp
 * @since 2018/9/11 15:01
 */
public class UserForm extends AbstractForm {

   private static final long serialVersionUID = 1725163648443611259L;

   private User user;

   private String captcha;

   public User getUser() {
      return user;
   }

   public void setUser(User user) {
      this.user = user;
   }

   public String getCaptcha() {
      return captcha;
   }

   public void setCaptcha(String captcha) {
      this.captcha = captcha;
   }
}
