package com.solvd.onlinemarket.onmarket;

import java.time.LocalDateTime;

public class Review {

    private Long id;
    private int score;
    private String comment;
    private LocalDateTime ratedAtDate;

    public Review() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getRatedAtDate() {
        return ratedAtDate;
    }

    public void setRatedAtDate(LocalDateTime ratedAtDate) {
        this.ratedAtDate = ratedAtDate;
    }
}
