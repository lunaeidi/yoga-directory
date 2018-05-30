# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  $(function () {
    $("button").on("click", function() {
      var poseid = $(this).attr("data-id"); 
        $.get("/poses/" + poseid + ".json", function(data) {
        var reviews= data["reviews"]

        reviews.forEach(function(review){

          $('#load-review').append("<li>"+review["username"] + " says " + review["content"]+"</li>")

        })
      })
    })
  })



  $(function () {
    $('form').submit(function(event) {

      event.preventDefault();
      event.stopPropagation()
        function Review(username, content) {
          this.username = username;
          this.content = content;
        }
        Review.prototype.postReview = function() {
            return `${this.username} says ${this.content} `
        }

  var id = parseInt($(".js-next").attr("data-id"))

      var posting = $.post('/reviews', $(this).serialize());

      posting.done(function(data) {
        $("#review_content").val("")
       var post = data;



       var review2 = new Review(post["username"], post["content"]);
          $("#review").html("<li>"+ review2.postReview() + "</li>")


      });
    });
  });
