//
// $(function() {
//   $(".load-poses").on("click", function() {
//     let userid = $(this).data("id");
//     $.get("/users/" + userid + ".json", function(data) {
//
//     let poses= data["poses"];
//     let poseDetails=""
//     poses.forEach(function(pose){
//
//       let pic= pose["image"]
//       $(".poses").append('<img src="'+ pic +'">')
//       $(".poses").append("<p>"+ pose["name"] + ' - '+ pose["level"]["level"] + "</p>"+"<br>")
//
//
//     })
//     });
//   });
// });
