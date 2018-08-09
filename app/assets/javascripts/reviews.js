

  $(function () {
    $(".loadReviews").on("click", function() {
      let poseid = $(this).attr("data-id");
        $.get(`/poses/${poseid}.json`, function(data) {
        let reviews= data["reviews"]

        // sort by name
      let sorted=  reviews.sort(function(a, b) {
          var contentA = a["content"].toUpperCase(); // ignore upper and lowercase
          var contentB = b["content"].toUpperCase(); // ignore upper and lowercase
          if (contentA < contentB) {
            return -1;
          }
          if (contentA > contentB) {
            return 1;
          }

          // names must be equal
          return 0;
        });

      // let sorted=  reviews.sort(function(a,b){
      //     return a["content"] - b["content"]
      //   })




        //reviews.forEach(function(review){
        sorted.forEach((review)=>{

          $('#load-review').append("<li>"+review["username"] + " says " + review["content"]+"</li>")

        })
      })
    })
  })



  $(function () {
    $('.reviewform').submit(function(event) {

      event.preventDefault();
      event.stopPropagation()
        function Review(username, content) {
          this.username = username;
          this.content = content;
        }
        Review.prototype.postReview = function() {
            return `${this.username} says ${this.content} `
        }

  let id = parseInt($(".js-next").attr("data-id"))

      var posting = $.post('/reviews', $(this).serialize());

      posting.done(function(data) {
        $("#review_content").val("")
       let post = data;



       let review2 = new Review(post["username"], post["content"]);
          $("#review").html("<li>"+ review2.postReview() + "</li>")


      });
    });
  });
