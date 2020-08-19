$(document).on('turbolinks:load',function(){
  // PAY.JPの公開鍵をセットします。
  Payjp.setPublicKey('pk_test_35f6203f9c0aa1345fd7c6f3');
  //formのsubmitを止めるために, クレジットカード登録のformを定義します。
  var form = $(".form");
  $("#charge-form").click(function() {
    // submitが完了する前に、formを止めます。
    form.find("input[type=submit]").prop("disabled", true);
    // submitを止められたので、PAY.JPの登録に必要な処理をします。
    // formで入力された、カード情報を取得します。
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };
    // PAYJPに登録するためのトークン作成
    Payjp.createToken(card, function(status, response) {
      if (response.error){
        // エラーがある場合処理しない。
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
        alert("登録に失敗しました")
      }   
      else {
        // エラーなく問題なく進めた場合
        // formで取得したカード情報を削除して、Appにカード情報を残さない。
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        // 変数tokenに値が格納されていない可能性が高い？→その為、コントローラー側でトークンが取得できずnewに戻される
        var token = response.id;
        console.log(token)
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
        alert("登録に成功しました");
      }
    });
  });
});