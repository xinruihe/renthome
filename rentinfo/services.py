from django.db import connection
from django.http import HttpResponse
import json

LISTINGS_QUERY = ('SELECT l.id, l.title, l.address, l.city, l.state, l.zipcode, '
    + 'X(l.location), Y(l.location), l.price, l.description, l.bedroom_num, l.bathroom_num, '
    + 'GROUP_CONCAT(i.url) '
    + 'FROM listing l '
    + 'JOIN images i ON i.listing_id = l.id '
    + 'WHERE ST_CONTAINS(ST_GeomFromText(\'POLYGON((%s))\'), l.location) '
    + 'GROUP BY l.id ')

# Create your views here.
def GetListings(request, points=None):
    pairs = points.split(',')
    parsed_points = []
    str_points = []
    debug = []
    for pair in pairs:
        p = pair.split(':')
        x = p[0]
        y = p[1]
        parsed_points.append((x, y))
        str_points.append(x + ' ' + y)
        debug.append({'x': x, 'y': y})

    polygon = ','.join(str_points)
    with connection.cursor() as cursor:
        query = LISTINGS_QUERY % polygon
        cursor.execute(query)
        listings = []
        for row in cursor.fetchall():
            info = {
                'id': row[0],
                'title': row[1],
                'address': row[2],
                'city': row[3],
                'state': row[4],
                'zipcode': row[5],
                'latitude': row[6],
                'longitude': row[7],
                'price': row[8],
                'description': row[9],
                'numBeds': row[10],
                'numBaths': row[11],
                'imageUrls': row[12].split(','),
            }
            listings.append(info)

    return HttpResponse(
        json.dumps({
            'params': debug, 
            'listings': listings
        }),
        content_type='application/json')
