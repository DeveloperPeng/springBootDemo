package com.wp.manager.controller;

import com.wp.manager.core.controller.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wp
 * @since 2018/9/10 17:16
 */
@Controller
public class DashboardController extends AbstractController {

    @RequestMapping("/dashboard")
    public String dashboard(ModelMap modelMap) {
        return "dashboard";
    }
}
