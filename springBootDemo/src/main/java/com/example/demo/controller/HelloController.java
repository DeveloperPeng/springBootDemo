package com.example.demo.controller;

import com.example.demo.bean.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wp
 * @since 2017/8/9
 */
@Controller
public class HelloController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello(Model model) {

        Person single = new Person("xx", 0);
        List<Person> people = new ArrayList<Person>();

        Person person1 = new Person("aa", 11);
        Person person2 = new Person("bb", 22);
        Person person3 = new Person("cc", 33);

        people.add(person1);
        people.add(person2);
        people.add(person3);
        model.addAttribute("singlePerson", single);
        model.addAttribute("people", people);

        return "index";
    }
}
