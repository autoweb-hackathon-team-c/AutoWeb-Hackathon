ion.sound({
  sounds: [{
    name: "nyanpass",
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
