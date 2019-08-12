#記述位置
　関数（function）は、自分自身が記述されているscriptエレメント内及び自分よりも前
  要するにhead内に記述しておけば、どこからでも呼び出せる訳です。
  <html>外部は不適切
#複数記述
  関数を複数セットする場合はセミコロン(;)で区切る。
    <form action="" method="post">
        <input type="button" value="ボタン" onClick="func01(); func02(); func03()">
    </form>


#window.resize
  <script>
  </head>
    <script type="text/javascript" language="javascript">
      <!--
        function sample() { window.resizeTo(600,400); }
      // -->
    </script>
  </head>
  <body>
    <a onclick="sample()">ここをクリックすると、ウィンドウサイズが幅600、高さ400となります。</a>
  </body>

#onload
  // ページの読み込み完了と同時に実行されるよう指定
  function firstscript() {
     alert('ページの読み込みが完了したよ！');
  }
  window.onload = firstscript;



snippet_submit-technix
	<%#= submit_tag l(:button_save), :kind => "save", :confirm => l(:button_curd_confirm) %>
	<%= submit_tag l(:button_ticket), :kind => "ticket", :confirm => l(:button_ticket_confirm) %>
	<%= javascript_tag do %>
	  // form外の値をしこむ
    $("#updating_form").submit( function(e) {
      var form = $("#updating_form");
      $('<input>').prop({ 'name': 'slider_toggle_checkbox', 'value': $('#slider_toggle_checkbox').prop("checked") }).appendTo(form);
    });

	  // Submitボタン切り替え
	  $(document).ready(function() {
      $(":submit").bind("click", function() {
        $("#commit_kind").val($(this).attr("kind"));
      });
	  });
	<% end %>



#大項目小項目チェック連動
    // 大項目チェックボックス整頓
    $(document).ready(function() {
      $("legend div .top_check_box").each(function (index) {
        var selector = "*:checkbox[id^='f_check_" + String(index + 1) + "_']:checked"
        if ($(this).closest('fieldset').find(selector).length == 0) {
          $(this).prop('checked', false)
        }
      });
    });

