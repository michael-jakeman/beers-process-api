package com.mike;

import org.apache.http.client.utils.URIUtils;
import java.net.URI;
import java.net.URISyntaxException;

public class ResolveUri {

    //TODO: Handle Query Parameters as they'll be removed from the output string
    public static String resolve(String url, String relativePath) throws URISyntaxException {
        URI location = URIUtils.resolve(new URI(url), relativePath);
        return location.toString();
    }

}
