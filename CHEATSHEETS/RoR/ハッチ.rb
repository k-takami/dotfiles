idだけとってきてバルク更新
update_all.*updated_atで更新時刻入れる
        Passcode.where(id: passcode_ids).update_all(
          notification_method: Passcode.notification_methods[:postcards_to_kenpo],
          updated_at: DateTime.current
        )
