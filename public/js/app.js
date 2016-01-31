ion.sound({
  sounds: [{
    name: "sheetbelt",
    volume: 0.2
  }, {
    name: "headlight",
    volume: 0.2
  },{
    name: "anzen",
    volume: 0.2
  },{
    name: "chikasugi",
    volume: 0.2
  },{
    name: "furatuki",
    volume: 0.2
  },{
    name: "otukare",
    volume: 0.2
  }],
  volume: 0.5,
  path: "sounds/",
  preload: true
});

$(document).ready(function() {
  $("#sound").click(function() {
    ion.sound.play("nyanpass");
  });
});
