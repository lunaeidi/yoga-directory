//
//
//   $(function () {
//     $(".loadReviews").on("click", function() {
//       console.log("A")
//       let poseid = $(this).attr("data-id");
//         $.get(`/poses/${poseid}.json`, function(data) {
//         let reviews= data["reviews"]
//
//         // sort by name
//       let sorted=  reviews.sort(function(a, b) {
//           var contentA = a["content"].toUpperCase(); // ignore upper and lowercase
//           var contentB = b["content"].toUpperCase(); // ignore upper and lowercase
//           if (contentA < contentB) {
//             return -1;
//           }
//           if (contentA > contentB) {
//             return 1;
//           }
//
//           return 0;
//         });
//
//         //reviews.forEach(function(review){
//         sorted.forEach((review)=>{
//           console.log("B")
//
//           $('#load-review').append("<li>"+review["username"] + " says " + review["content"]+"</li>")
//
//         })
//       })
//     })
//   })
//
//
//
//   $(function () {
//     $('.reviewform').submit(function(event) {
//
// console.log("D")
//       event.preventDefault();
//       event.stopPropagation()
//         function Review(username, content) {
//           this.username = username;
//           this.content = content;
//         }
//         Review.prototype.postReview = function() {
//             return `${this.username} says ${this.content} `
//         }
//
//   let id = parseInt($(".js-next").attr("data-id"))
//
//       let posting = $.post('/reviews', $(this).serialize());
// console.log("C")
//       posting.done(function(data) {
//         $("#review_content").val("")
//        let post = data;
//
//
//
//        let review2 = new Review(post["username"], post["content"]);
//           $("#review").html("<li>"+ review2.postReview() + "</li>")
//
//
//       });
//     });
//   });
