// $(function(){
//   $('.optionContent__favoBtn').on('click', function(e) {
//     e.preventDefault();
//     let favorite = $('#add-favorite').val();
//     console.log(favorite);
//   });
// });



// $(function(){
//   function buildHTML(favorite){
//     let html =
//       `<p class="optionContent__favoBtn--num">
//           ${favorite.user_name}
//       </p>`
//     return html;
//   }
//   $('.optionContent__favoBtn').on('click', function(){
//     let formData = new FormData(this);
//     let url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "GET",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//   })
//   .done(function(data){
//     let html = buildHTML(data);
//     $('#js-favorite-button-for-product-#{@product.id}').append(html);
//   })
//   .fail(function(){
//     alert("メッセージの送信に失敗しました");
//   });
// });