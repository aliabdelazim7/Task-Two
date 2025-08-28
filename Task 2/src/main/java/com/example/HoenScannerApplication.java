package com.example;

import com.example.resources.SearchResource;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.dropwizard.core.Application;
import io.dropwizard.core.setup.Bootstrap;
import io.dropwizard.core.setup.Environment;
import com.example.models.SearchResult;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class HoenScannerApplication extends Application<HoenScannerConfiguration> {

    private static List<SearchResult> searchResults = new ArrayList<>();

    public static void main(final String[] args) throws Exception {
        new HoenScannerApplication().run(args);
    }

    @Override
    public String getName() {
        return "Hoen Scanner";
    }

    @Override
    public void initialize(final Bootstrap<HoenScannerConfiguration> bootstrap) {
        // nothing to do yet
    }

    @Override
    public void run(final HoenScannerConfiguration configuration,
                    final Environment environment) throws Exception {
        
        // Load JSON files into searchResults list
        ObjectMapper mapper = new ObjectMapper();
        
        try (InputStream rentalCarsStream = getClass().getClassLoader().getResourceAsStream("rental_cars.json");
             InputStream hotelsStream = getClass().getClassLoader().getResourceAsStream("hotels.json")) {
            
            if (rentalCarsStream != null) {
                List<SearchResult> rentalCars = mapper.readValue(rentalCarsStream, new TypeReference<List<SearchResult>>() {});
                searchResults.addAll(rentalCars);
            }
            
            if (hotelsStream != null) {
                List<SearchResult> hotels = mapper.readValue(hotelsStream, new TypeReference<List<SearchResult>>() {});
                searchResults.addAll(hotels);
            }
        }
        
        // Register the search resource
        environment.jersey().register(new SearchResource(searchResults));
    }
}
