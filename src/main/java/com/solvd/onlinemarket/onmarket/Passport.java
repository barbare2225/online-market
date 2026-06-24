package com.solvd.onlinemarket.onmarket;

import java.time.LocalDate;

public class Passport {

    private Long ID;
    private LocalDate expirationDate;

    public Passport() {
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

}
