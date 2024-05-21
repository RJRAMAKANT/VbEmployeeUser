<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Latitude.aspx.vb" Inherits="Latitude" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Geocode Address</title>
<script>
    function getCoordinates() {
        var address = document.getElementById('address').value;
        var apiKey = '663de319625ff634151088cxw53bdf6';
        var url = 'https://geocoder.api.here.com/6.2/geocode.json?searchtext=' + encodeURIComponent(address) + '&app_id=' + apiKey + '&app_code=' + apiKey;

        fetch(url)
          .then(response => response.json())
          .then(data =>{
              var lat = data.Response.View[0].Result[0].Location.DisplayPosition.Latitude;
        var lng = data.Response.View[0].Result[0].Location.DisplayPosition.Longitude;
        document.getElementById('lat').value = lat;
        document.getElementById('lng').value = lng;
    })
    .catch(error => console.error('Error:', error));
    }
</script>
</head>
<body>
<h1>Geocode Address</h1>
<form>
  <label for="address">Address:</label>
  <input type="text" id="address" name="address">
  <br>
  <label for="lat">Latitude:</label>
  <input type="text" id="lat" name="lat" readonly>
  <br>
  <label for="lng">Longitude:</label>
  <input type="text" id="lng" name="lng" readonly>
  <br>
  <button type="button" onclick="getCoordinates()">Get Coordinates</button>
</form>
</body>
</html>
