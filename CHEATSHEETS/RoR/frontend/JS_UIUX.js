
# 画面遷移：もと画面リロード（ただしrender２度るので、単純にflash messageをつかえない。sessionかなにかに保存しないとダメ）
        # render html: '<body onload="window.opener.location.reload(); window.close()"></body>'.html_safe


#fileupload#1 : create/new　新規登録系のボタンにはみなこれ；
    <%= f.fields_for :some_orm_model, @model.some_orm_model.new do |b| %>
      <label class="btn btn-primary waves-effect waves-light">Upload
        <%= b.file_field :file, class: 'upload-button', style: 'display: none'%>
      </label>
    <% end %>
    $('input:file.upload-button').change(function(){
        var form = $(this).closest('form');
        var label = $(this).closest('label');
        // var original_caption = label[0].innerText;
        // var form = $(this).parents('form');
        // var label = $(this).parents('label');
        form.submit();
        label.prop('disabled', true);
        label[0].innerText = "Please Wait...";
    })

    *f.submitをつかっていれば{ disable_with: "Please wait送信中..." } などとできるが、file_fieldではつかえない。



# 一括ON/OFF check
   一括チェック
      wrapper.on 'click', '.check_all', ->
        $(this).removeClass('check_all')
        $(this).addClass('un_check_all')
        $(this).parents().find('.checkbox, .checkbox_rtf').each ->
          $(this).trigger 'click' unless $(this).is(':checked'

#  チェックした行を削除
          wrapper.on 'click', '.btn_delete', ->
            arr_check = []
            $(this).parents().find('.checkbox, .checkbox_rtf').each ->
              arr_check.push('1') if $(this).is(':checked')
            return show_message_validate_custom('削除対象にチェックしてください。') unless arr_check.length

# 一括更新　UI
  $('.bulk-update').on 'click', ->
    check_boxes = $(this).parents().find('input[name^="ids"]:checked')
    return alert('更新対象にチェックしてください。') unless check_boxes.length > 0
    # 一括更新レコード要素をid配列にmapし、formに input.update としてセットする
    checked_ids = (item.value for item in check_boxes)
    form = $("#frm_update_record_hoken_#{kai}_data")
    $('<input>').prop({
      'type': 'hidden', 'name': 'update', 'value': checked_ids
    }).appendTo(form)
    $('<input>').prop({
      'type': 'hidden', 'name': 'target_model', 'value': target_model
    }).appendTo(form)
    json_data = {}
    check_boxes.parent().parent().find('input').each ->
      json_data[$(this).attr('att')] = $(this).val() if $(this).attr('att')

    $('<input>').prop({
      'type': 'hidden', 'name': 'data', 'value': JSON.stringify(json_data)
    }).appendTo(form)
    # new_json_data = {}
    # check_boxes.each ->
    #   new_json_data[$(this).value] = rowIntoHash($(this))

    form.submit()

  # rowIntoHash = (dom_node) ->
  #   hash = {}
  #   # tgt = dom_node.parent().parent().find('input')
  #   # for element in tgt
  #   dom_node.parent().parent().find('input').each ->
  #     hash[$(this).attr('att')] = $(this).val() if $(this).attr('att')




# DataTablesと二階建てのmodal --> Dynalist


#rails5: turbolinks+ajax
<%= select_tag 'filt',
options_for_select(['A', 'B, 'C', 'D, 'E']),
class: 'custom-select col-md-4', prompt: t('pulldown.default'),
onchange: 'Rails.fire($(this).closest("form")[0], \'submit\')' %>

// 追加レコード作成画面を別タブで開く　jump/open in a new tab
var href = $(this).parents('tr').prev('tr').find('td:last').find('a').attr('href')
incremented_num = parseInt(href.match(/\d+$/).toString()) + 1
var win = window.open(href.replace(/\d+$/gm, incremented_num), '_blank');
if (win) {
    win.focus();
} else {
    alert('Please allow popups for this website');
}


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



#selectbox text取得　JQ
$('#project_implementation_plan_receiving_country_id option:selected').text()



### WITH COFFEE SCRIPT ###
Chart.defaults.global.tooltips.enabled = true;
    #suppress = do ->
      #this.showTooltip(this.segments, true)
      tooltipTemplate: "<%if (label){%><%=label%><%}%>",
      onAnimationComplete: suppress,
      tooltipEvents: [],
      showTooltips: true,

      onAnimationComplete: (->
        if @options.showInlineValues
          if @name == 'Bar'
            @eachBars (bar) ->
              tooltipPosition = bar.tooltipPosition()
              new (Chart.Tooltip)(
                x: Math.round(tooltipPosition.x)
                y: if @options.centeredInllineValues then Math.round(bar.y + bar.height() / 2 + (@options.tooltipFontSize + @options.tooltipYPadding) / 2) else Math.round(tooltipPosition.y)
                xPadding: @options.tooltipXPadding
                yPadding: @options.tooltipYPadding
                fillColor: @options.tooltipFillColor
                textColor: @options.tooltipFontColor
                fontFamily: @options.tooltipFontFamily
                fontStyle: @options.tooltipFontStyle
                fontSize: @options.tooltipFontSize
                caretHeight: @options.tooltipCaretSize
                cornerRadius: @options.tooltipCornerRadius
                text: bar.value
                chart: @chart).draw()
              return
      ),

      tooltipEvents: [],
      onAnimationComplete: (->
        @eachBars (bar) ->
          tooltipPosition = bar.tooltipPosition()
          new (Chart.Tooltip)(
            x: Math.round(tooltipPosition.x)
            y: Math.round(tooltipPosition.y)
            xPadding: @options.tooltipXPadding
            yPadding: @options.tooltipYPadding
            fillColor: @options.tooltipFillColor
            textColor: @options.tooltipFontColor
            fontFamily: @options.tooltipFontFamily
            fontStyle: @options.tooltipFontStyle
            fontSize: @options.tooltipFontSize
            caretHeight: @options.tooltipCaretSize
            cornerRadius: @options.tooltipCornerRadius
            text: bar.value
            chart: @chart).draw()
          return
        return
      ),

#jquery.narrows by monmonmon
# NOTE: ハードコーディングにちかいので、マスター投入型GUIには不適切。
              <div class="row px-3">
                <label class="col-md-3 text-primary bg-primary4 py-2"> Receive Honorarium: </label>
                <div class="form-group col-md">
                  <select class="browser-default custom-select" id="GUI1ID" name="resource_person[receive_honorarium]">
                    <!-- <option value="">-- Select --</option> -->
                    <option value="GUI1OPTION1">Yes</option>
                    <option value="GUI1OPTION12">No</option>
                  </select>
                </div>
                <label class="col-md-3 text-primary bg-primary4 py-2"> (In case of NO)Reason: </label>
                <div class="form-group col-md">
                  <select class="browser-default custom-select" id="SOMEID" name="resource_person[reason]">
                    <!-- <option value="">-- Select --</option> -->
                    <option data-GUI1ID="GUI1OPTION12" value="GUI2OPTION1">Service Received from International Organization</option>
                    <option data-GUI1ID="GUI1OPTION12" value="GUI2OPTION2">Unable to receive</option>
                    <option data-GUI1ID="GUI1OPTION1" value="GUI2OPTION3">Not applicable</option>
                    <option data-GUI1ID="GUI1OPTION12" value="GUI2OPTION4">Voluntary work</option>
                    <option data-GUI1ID="GUI1OPTION12" value="GUI2OPTION5">Other</option>
                  </select>
                  <script type="text/javascript">
                    window.addEventListener('load', function(){
                      $(function(){
                        $('#GUI1ID').narrows('#resource_person_reason', {disable_if_parent_is_null: false, allow_multiple_parent_values: true});
                      });
                    });
                  </script>
                </div>
              </div>


# snippet_select2
  Gemfile & its .lock
    gem 'select2-rails'

  app/assets/javascripts/application.js
    //= require select2

  app/assets/stylesheets/application.scss
    @import "select2";
    @import "select2-bootstrap";


  @V
    <div class="row px-3">
      <%= f.label :some_attr_name, 'SomeLabelCaption', class: "col-xl-2 col-lg-3 col-md-4 text-primary bg-primary4 py-2" %>
      <div class="form-group col-xl-10 col-lg-9 col-md-8 mt-1">
        <%= f.select :some_attr_name, [], { include_blank: "❎消去前のデフォルト値" }, class: "browser-default custom-select", id: "select2_1" %>
      </div>
    </div>

    // 基本
    $('#select2').select2({
      width: 'style',
      theme: 'bootstrap',
      placeholder: '<%= '❎消去後のデフォルト値' %>',
      allowClear: true,
      minimumInputLength: 1,
    });


    // AJAX つかうばあい
    $('[id^="select2_"]').select2({
      width: 'style',
      theme: 'bootstrap',
      placeholder: '<%= '❎消去後のデフォルト値' %>',
      allowClear: true,
      minimumInputLength: 1,
      // placeholder: "選択してください",
      //
      // ajaxでの表示値取得と placeholder+alloClearは両立困難でトリックが必要っぽい
      // https://www.flatflag.nir87.com/remove-986#remove
      // $(""select2-selection__clear").parant().nearest("span").removeClass; か。
      ajax: {
        cache: true,
        url: "/pms/projects/1/basic/edit.json",
        dataType: "json",
        delay: 200,
        data: function(params) {
          return { "project[some_attr_name]": params.term };
        },
        processResults: function(data, params) {
          return {
            results: data.map( function(v) {
              return { id: v.id, text: v.code + ": " + v.name };
            })
          };
        }
      }
    });

  @C
    if request.xhr?
      key = params[:project].keys.grep(/implementing_organization/).first
      if key
        json = ImplementingOrganization.where(
          'name LIKE ? OR code LIKE ?', "%#{params[:project][key]}%", "%#{params[:project][key]}%"
        ).select(:id, :code, :name).to_json
      end
      render json: json, status: :ok
    end



