
    ### snipet-rails-prev-next-item-navigation
      <% #一度に類似モジュール二個以上つくれと期待される場合のひながたコード;
        model =  eval(controller_name.singularize.classify)
        orm_models = controller_name
        new_document_id = model.ids.max.to_i + 1
        current_participant_index = @project.participants.ids.index(@participant.id)
        if current_participant_index
          prev_participant = current_participant_index == 0 ? nil : @project.participants[current_participant_index - 1]
          next_participant = @project.participants[current_participant_index + 1]
          prev_id = prev_participant&.send(orm_models)&.find_by(project_id: @project.id)&.id || new_document_id
          next_id = next_participant&.send(orm_models)&.find_by(project_id: @project.id)&.id || new_document_id
          prev_page = prev_participant ? "/pms/projects/#{@project.id}/participants/#{prev_participant.id}/#{controller_name}/#{prev_id}/edit" : nil
          next_page = next_participant ? "/pms/projects/#{@project.id}/participants/#{next_participant.id}/#{controller_name}/#{next_id}/edit" : nil
        else
          prev_page = next_page = nil
          prev_id = next_id = new_document_id
        end
      %>




