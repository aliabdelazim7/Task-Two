package com.example.models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Search {
    private String city;

    public Search() {
        // Default constructor for Jackson
    }

    public Search(String city) {
        this.city = city;
    }

    @JsonProperty
    public String getCity() {
        return city;
    }

    @JsonProperty
    public void setCity(String city) {
        this.city = city;
    }
}
