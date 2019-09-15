
#jquery.narrows by monmonmon
              <div class="row px-3">
                <label class="col-md-3 text-primary bg-primary4 py-2"> Receive Honorarium: </label>
                <div class="form-group col-md">
                  <select class="browser-default custom-select" id="resource_person_receive_honorarium" name="resource_person[receive_honorarium]">
                    <!-- <option value="">-- Select --</option> -->
                    <option value="yes_receive">Yes</option>
                    <option value="no_receive">No</option>
                  </select>
                </div>
                <label class="col-md-3 text-primary bg-primary4 py-2"> (In case of NO)Reason: </label>
                <div class="form-group col-md">
                  <select class="browser-default custom-select" id="resource_person_reason" name="resource_person[reason]">
                    <!-- <option value="">-- Select --</option> -->
                    <option data-resource_person_receive_honorarium="no_receive" value="service_received">Service Received from International Organization</option>
                    <option data-resource_person_receive_honorarium="no_receive" value="unable_to_receive">Unable to receive</option>
                    <option data-resource_person_receive_honorarium="yes_receive" value="not_applicable">Not applicable</option>
                    <option data-resource_person_receive_honorarium="no_receive" value="voluntary_work">Voluntary work</option>
                    <option data-resource_person_receive_honorarium="no_receive" value="other">Other</option>
                  </select>
                  <script type="text/javascript">
                    window.addEventListener('load', function(){
                      $(function(){
                        $('#resource_person_receive_honorarium').narrows('#resource_person_reason', {disable_if_parent_is_null: false, allow_multiple_parent_values: true});
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

