package com.solvd.onlinemarket.onmarket;

import java.time.LocalDate;

public class Passport {

    private Long id;
    private LocalDate expirationDate;

    public Passport() {
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
