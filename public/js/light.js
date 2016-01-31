// example
// light(134.207916667, 35.5126777778, "2016-01-31T16:20:00%2B09:00", function(error, data){console.log(error, data)});
function light(lat, lon, datetime, callback) {
  var params = {
    lat: lat,
    lon: lon,
    datetime: datetime,
  };
  $.getJSON('light.json', params, function(data) {
    callback(null, data);
  });
};
