package com.solvd.onlinemarket.onmarket;

import java.time.LocalDateTime;

public class Review {

    private Long ID;
    private int score;
    private String comment;
    private LocalDateTime ratedAtDate;

    public Review() {
    }

    public Long getID() {
        return ID;
    }

    public void setID(Long ID) {
        this.ID = ID;
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
