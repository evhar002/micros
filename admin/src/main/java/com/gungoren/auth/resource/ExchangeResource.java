package com.gungoren.auth.resource;

import com.gungoren.auth.model.Exchange;
import com.gungoren.auth.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@RestController
@RequestMapping("/exchange")
public class ExchangeResource {

    @Autowired
    private ExchangeService exchangeService;

    @RequestMapping(method = RequestMethod.GET, path = "/list")
    public ResponseEntity<List<Exchange>> getExchangeList()
    {
        return new ResponseEntity<List<Exchange>>(exchangeService.getExchanges(), HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{id}")
    public ResponseEntity<Exchange> getExchange(@PathVariable("id") long id)
    {
        return new ResponseEntity<Exchange>(exchangeService.getExchange(id), HttpStatus.OK);
    }

    @RequestMapping(value = "/exchange/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody Exchange exchange, UriComponentsBuilder ucBuilder)
    {
        System.out.println("Creating Exchange " + exchange.getName());

        if (exchangeService.isExchangeExist(exchange))
        {
            System.out.println("A Exchange with name " + exchange.getName() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }

        exchangeService.saveExchange(exchange);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(exchange.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
}
