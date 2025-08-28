package com.example.resources;

import com.example.models.Search;
import com.example.models.SearchResult;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;
import java.util.stream.Collectors;

@Path("/search")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class SearchResource {

    private final List<SearchResult> searchResults;

    public SearchResource(List<SearchResult> searchResults) {
        this.searchResults = searchResults;
    }

    @POST
    public List<SearchResult> search(Search search) {
        return searchResults.stream()
                .filter(result -> result.getCity().toLowerCase().equals(search.getCity().toLowerCase()))
                .collect(Collectors.toList());
    }
}
