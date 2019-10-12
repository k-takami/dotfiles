
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


#  確認型ボタン
  <button type="button" class="btn btn-danger btn-sm" onClick="if (confirm('Are you sure?')) location.href='<%= request.path << '?refresh=erase' %>';">


#rails5: turbolinks+ajax
<%= select_tag 'filt',
options_for_select(['A', 'B, 'C', 'D, 'E']),
class: 'custom-select col-md-4', prompt: t('pulldown.default'),
onchange: 'Rails.fire($(this).closest("form")[0], \'submit\')' %>


