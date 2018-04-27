package com.gungoren.auth.dao;

import com.gungoren.auth.model.Exchange;

import java.util.List;

public interface ExchangeDAO {

    List<Exchange> getExchanges();

    Exchange create(Exchange exchange);

    Exchange getExchange(long id);

    boolean isExchangeExist(Exchange exchange);
}
