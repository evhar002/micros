package com.gungoren.auth.service;

import com.gungoren.auth.dao.ExchangeDAO;
import com.gungoren.auth.model.Exchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExchangeServiceImpl implements ExchangeService {

    @Autowired
    private ExchangeDAO exchangeDAO;


    public List<Exchange> getExchanges() {
        return exchangeDAO.getExchanges();
    }

    public Exchange getExchange(long id) {
        return exchangeDAO.getExchange(id);
    }

    public boolean isExchangeExist(Exchange exchange) {
        return exchangeDAO.isExchangeExist(exchange);
    }

    public void saveExchange(Exchange exchange) {
        exchangeDAO.create(exchange);
    }
}
