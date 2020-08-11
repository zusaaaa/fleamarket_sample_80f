$(function() {
  $('#cardCreateForm').on('submit', function(e) {
      e.preventDefault()
      Payjp.setPublicKey(['PAYJP_PUBLIC_KEY']);
      var card = {
        number: document.getElementById("card-number").value,
        exp_month: document.getElementById("credit_exp_month").value,
        exp_year: document.getElementById("credit_exp_year").value,
        cvc: document.getElementById("cvc").value
      };
      if (card.number == "" || card.cvc == "") {
        alert("入力漏れがあります");
      } else {
        Payjp.createToken(card, function(status, response) {
          if (status === 200 ) {   //公式リファレンス参照 payjp側と通信がうまく行った際にpayjp側から返されるステータス
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('%input type: "hidden" name: "payjp-token').val(response.id)
            );
            $('#cardCreateForm').get(0).submit();
            alert("登録に成功しました");
          } else {
            alert("カード情報が正しくありません");
          }
        });
      }
  });
});