import pandas as pd
from shapely.geometry import shape, Point
import json

df_points = pd.read_csv("/Users/shynmere/Desktop/data-files/cleaned-vers-nibrs24.csv")  

with open("/Users/shynmere/Desktop/data-files/houston.geojson") as f:
    geojson_data = json.load(f)

polygons = []
names = []

for feature in geojson_data["features"]:
    geom = shape(feature["geometry"])
    name = feature["properties"].get("NAME") or feature["properties"].get("Name") or feature["properties"].get("name")
    if geom.geom_type == "MultiPolygon":
        for poly in geom.geoms:
            polygons.append(poly)
            names.append(name)
    elif geom.geom_type == "Polygon":
        polygons.append(geom)
        names.append(name)

def find_neighborhood(lon, lat):
    point = Point(lon, lat)
    for poly, name in zip(polygons, names):
        if poly.contains(point):  
            return name
    return None


df_points["Neighborhood"] = df_points.apply(
    lambda row: find_neighborhood(row["MapLongitude"], row["MapLatitude"]),
    axis=1
)

df_points.to_csv("/Users/shynmere/Desktop/data-files/nibrs24-with-neighborhoods.csv", index=False)
print("Done")
