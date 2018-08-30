//
//
// $(function () {
//   $(".js-next").on("click", function(e) {
//     e.preventDefault()
//     let Id= parseInt($(".js-next").attr("data-id"))
//     let nextId = parseInt($(".js-next").attr("data-id")) + 1
//         $.getJSON("/poses/" + nextId + ".json", function(data) {
//
//         let form_field=  $("#review_pose_id")
//         form_field.val(nextId)
//         $("#load-review").html("")
//         $("#review").html("")
//         $("button").attr("data-id", data["id"])
//
//
//
//       $(".poseName").text(data["name"]);
//       $(".poseContent").text(data["content"]);
//
//       let pic= data["image"]
//       $(".poseImage").html('<img src="'+ pic +'">')
//       let categories= data["categories"]
//       categoryNames=''
//       categories.forEach((category)=>{
//       //categories.forEach(function(category){
//         categoryNames+= category["name"]
//       })
//       $(".poseCategories").text(categoryNames)
//
//       if (data["reviews"].length > 0){
//              let reviews = data["reviews"];
//              let reviewContents = "";
//              //reviews.forEach(function(review) {
//              reviews.forEach((review)=>{
//
//                reviewContents += review["content"]
//              });
//
//            }
//         $(".js-next").attr("data-id", data["id"]);
//
//     });
//   });
// });
