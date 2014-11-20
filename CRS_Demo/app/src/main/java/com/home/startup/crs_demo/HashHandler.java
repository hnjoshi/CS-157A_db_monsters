package com.home.startup.crs_demo;

import java.security.MessageDigest;

/**
 * Created by HN on 7/19/2014.
 */
public class HashHandler {

    public byte[] genHashOf(String password)
    {
        byte[] digest = null;

        try{
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            String pass = password + "M31-GalaxY";

            md.update(pass.getBytes("UTF-16"));
            digest = md.digest();
        }
        catch (Exception e)
        {

        }

        return digest;
    }

    public boolean compareHash(String h1, String h2)
    {
        boolean sameHash = false;

        if(h1.equals(h2))
        {
            sameHash = true;
        }

        return sameHash;
    }
}
