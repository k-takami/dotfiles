ActiveSupport
	.camelize  <=> .underscore
	.tablerize <=>.classify
	.humanize
	.constantize.new
	.***gytes
	XML
	xml= <<-ENDOFHEARDOC
		<?xml....
		<entry>
			......
		</entry>
	ENDOFHEARDOC
	.from_xml(xml)
なければつくる
	Model.find_or_create_by_<attribute>(:<attribute> => "")
		eg) CheckItem.find_or_create_by({ check_item_code: '9N791000000000011', updated_ip_address: '127.0.0.1' })
	Model.find_or_initialize_by_<attribute>(:<attribute> => "")
		eg) User.find_or_initialize_by(kumiai_code: "dsc#{i.to_s}", encrypted_account_id: SymmetricEncryption.encrypt("desc#{i.to_s}admin"))
ENUM
	Rails4.1~ ENUM
	 # Rails Enum # passcode.postcards_to_kenpo! 
# Passcode.notification_methods[:postcards_individually] 
# Passcode.postcards_individually 
# => <ActiveRecord::Relation []> pp data_row_result_instances.first[-1][-1].passcode_model byebug



	gem Enumerize
		CoinSupplyingTrigger.trigger_type.find_value(:expired).value
		﻿  enumerize :trigger_type, in: { time: 1, lot: 2, request: 3, purchase: 4, bonus: 5, consume: 6, direct_add: 7, direct_reduce: 8, expired: 9 }, scope: true



一括更新
current_time　=Time.zone.now

            destination_wallet_coins.update_all do |el|
              el.number += number_tobe_transfered
              el.updated_at: current_time,
              el.save!
            end 
            #XXX: validateしたければ　もしくはdestination_wallet_coins.update(destination_wallet_coins.ids, Array.new(destination_wallet_coins.ids.size,number: number_tobe_transfered))
**(options_for_select(KV二次元配列やハッシュ、:selected=>選択状態にしたい値).sub(/="selected/,'="yes') ** #<---selected=yesにしないと最近のブラウザーが認識しない傾向
options_from_collection_for_select(:value列、:選択肢文言列、selected: 値)
#Scope
	Passcode.limit(1000).offset(0).by_hokensha_bango(hokensha_bango).includes(member: [:hokenshas, :member_peculiarity, :work_place]).includes(:passcode_transitions).where(state: [:issued, :reissued]).where(members: {expired: false}).to_sql


