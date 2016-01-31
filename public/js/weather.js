function test() {
  params = {
    key: '74b582a3f26c0532048be90d924f2225',
    format: 'json',
    lat: 35.44394166670,
    lon: 133.35246388900,
  };
  $.get('http://api.yumake.jp/1.0/forecastMsm.php', params, function() {
    console.log(arguments);
  });

  //
  console.log('test');
};
