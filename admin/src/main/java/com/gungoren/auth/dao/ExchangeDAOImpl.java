package com.gungoren.auth.dao;

import com.gungoren.auth.model.Exchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class ExchangeDAOImpl implements ExchangeDAO {

    @Autowired
    @Qualifier("mysqlJdbcTemplate")
    JdbcTemplate jdbcTemplate;

    public List<Exchange> getExchanges() {
        return jdbcTemplate.query("SELECT * FROM exchanges", new ExchangeRowMapper());
    }

    public Exchange getExchange(long id) {
        List<Exchange> result = jdbcTemplate.query("SELECT * FROM exchanges where id = ?", new ExchangeRowMapper(), id);
        if (result.size() == 0)
            return null;
        return result.get(0);
    }

    public boolean isExchangeExist(Exchange exchange) {
        return jdbcTemplate.query("SELECT cnt(1) FROM exchanges where name = ?", new ExchangeRowMapper(), exchange.getName()).size() > 0;
    }

    public Exchange create(final Exchange exchange) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps =
                        connection.prepareStatement("INSERT INTO exchanges (name) VALUES (?)", new String[] {"id"});
                ps.setString(1, exchange.getName());
                return ps;
            }
        }, keyHolder);
        exchange.setId((Long) keyHolder.getKey());
        return exchange;
    }

    class ExchangeRowMapper implements RowMapper<Exchange>{

        public Exchange mapRow(ResultSet resultSet, int i) throws SQLException {
            Exchange exchange = new Exchange();
            exchange.setId(resultSet.getLong("id"));
            exchange.setName(resultSet.getString("name"));
            return exchange;
        }
    }
}
