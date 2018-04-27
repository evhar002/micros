package com.gungoren.auth.service;

import com.gungoren.auth.model.Exchange;

import java.util.List;

public interface ExchangeService {

    List<Exchange> getExchanges();

    Exchange getExchange(long id);

    boolean isExchangeExist(Exchange exchange);

    void saveExchange(Exchange exchange);
}
