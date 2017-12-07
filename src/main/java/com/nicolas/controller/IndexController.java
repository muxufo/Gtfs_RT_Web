package com.nicolas.controller;

/**
 * Created by David on 2017-04-03.
 */

import com.nicolas.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class IndexController {

//    public static void main(String[] args) throws Exception {
//        SpringApplication.add(IndexController.class, args);
//    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView table() {

        return new ModelAndView("table", "command", new com.nicolas.model.Model());
    }

    @RequestMapping(value = "/showTablePosition", method = RequestMethod.POST)
    public String tableSubmitPosition(@ModelAttribute("SpringWeb") com.nicolas.model.Model table, ModelMap model) {
        Model.ViderListePose();
        try {
            table.RemplirListePose();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "showTablePosition";
    }

    @RequestMapping(value = "/showTableTripUpdate", method = RequestMethod.POST)
    public String tableSubmitTrip(@ModelAttribute("SpringWeb") com.nicolas.model.Model table, ModelMap model) {
        Model.ViderListeTripUpdate();
        try {
            table.RemplirListeTripUpdate();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "showTableTripUpdate";
    }

    @RequestMapping(value = "/showTableAlert", method = RequestMethod.POST)
    public String tableSubmitAlert(@ModelAttribute("SpringWeb") com.nicolas.model.Model table, ModelMap model) {
        Model.ViderListeAlert();
        try {
            table.RemplirListeAlert();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "showTableAlert";
    }

    @RequestMapping(value = "/showTableTripUpdatePosition", method = RequestMethod.POST)
    public String tableSubmitTripPosition(@ModelAttribute("SpringWeb")com.nicolas.model.Model table, ModelMap model){
        Model.ViderListeTripUpdate();
        Model.ViderListePose();
        try {
            table.RemplirListePose();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            table.RemplirListeTripUpdate();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  "showTableTripUpdatePosition";
    }
}