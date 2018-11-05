package com.wp.manager.core.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author wp
 * @since 2018/9/10 17:13
 */
public class BaseController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    protected final static String ERROR_MESSAGE_KEY = "errorMessage";
    protected final static String SUCCESS_MESSAGE_KEY = "successMessage";
    protected final static String WARNING_MESSAGE_KEY = "warningMessage";
    protected final static String FORWARD_URL_KEY = "forwardUrl";

    protected final static String BINDING_RESULT_KEY = "bindingResult";
}
