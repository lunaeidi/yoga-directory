# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  $(".load-poses").on("click", function() {
    var userid = $(this).data("id");
    $.get("/users/" + userid + ".json", function(data) {

    var poses= data["poses"];
    var poseDetails=""
    poses.forEach(function(pose){

      var pic= pose["image"]
      $(".poses").append('<img src="'+ pic +'">')
      $(".poses").append("<p>"+ pose["name"] + ' - '+ pose["level"]["level"] + "</p>"+"<br>")
      

    })
    });
  });
});
