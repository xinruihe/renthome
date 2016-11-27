from __future__ import unicode_literals

from django.db import models

# Create your models here.
class RentInfo(models.Model):
    title = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=200)
    zipcode = models.CharField(max_length=200)
        
    

public class ListingModel {
    public int id;
    public String title;
    public String address;
    public String city;
    public String zipcode;
    public double latitude;
    public double longitude;
    public int price;
    public List<String> imageUrls;
    public String description;
    public int numBeds;
    public int numBaths;
}
