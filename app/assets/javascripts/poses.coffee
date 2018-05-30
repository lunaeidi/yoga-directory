# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var Id= parseInt($(".js-next").attr("data-id"))
    var nextId = parseInt($(".js-next").attr("data-id")) + 1
        $.getJSON("/poses/" + nextId + ".json", function(data) {

        var form_field=  $("#review_pose_id")
        form_field.val(nextId)
        $("#load-review").html("")
        $("#review").html("")
        $("button").attr("data-id", data["id"])



      $(".poseName").text(data["name"]);
      $(".poseContent").text(data["content"]);

      var pic= data["image"]
      $(".poseImage").html('<img src="'+ pic +'">')
      var categories= data["categories"]
      categoryNames=''
      categories.forEach(function(category){
        categoryNames+= category["name"]
      })
      $(".poseCategories").text(categoryNames)

      if (data["reviews"].length > 0){
             var reviews = data["reviews"];
             var reviewContents = "";
             reviews.forEach(function(review) { //need to make the post review form work too here !

               reviewContents += review["content"]
             });

           }
        $(".js-next").attr("data-id", data["id"]);

    });
  });
});
