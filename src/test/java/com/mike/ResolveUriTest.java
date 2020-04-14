package com.mike;

import org.junit.Test;
import com.mike.ResolveUri;
import java.net.URISyntaxException;

public class ResolveUriTest {

    ResolveUri resolveUri = new ResolveUri();
    private final static String BASE = "https://localhost:8092/v1/beers";

    @Test
    public void replacePath() throws URISyntaxException {
        String newPath = "/v1/breweries";
        String newUrl = resolveUri.resolve(BASE, newPath);
        String expected = "https://localhost:8092/v1/breweries";
        assert(newUrl.toString().equals(expected));
    }

    @Test
    public void relativePath() throws URISyntaxException {
        String newPath = "./breweries";
        String newUrl = resolveUri.resolve(BASE, newPath);
        String expected = "https://localhost:8092/v1/breweries";
        assert(newUrl.equals(expected));
    }

    @Test
    public void relativePathWithDifferentVersion() throws URISyntaxException {
        String newPath = "../v2/breweries";
        String newUrl = resolveUri.resolve(BASE, newPath);
        String expected = "https://localhost:8092/v2/breweries";
        assert(newUrl.equals(expected));
    }

}

