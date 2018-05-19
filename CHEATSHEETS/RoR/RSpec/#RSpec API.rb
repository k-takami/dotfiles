宣言
require 'active_job_helper'
require 'rails_helper'
require 'yamazaki'
require 'jwt'
require 'yamazaki/config'
require 'yamazaki/mock/response/ope/passcodes/passcode_list'

RSpec.describe PasscodeKohaiReserveJob, type: :job do
  let(:tmp_input_dir)  { IODirHelper.path_for_tmp }
  let(:input_filename) { tmp_input_dir.join('normal.csv') }
  let(:hokensha_bango) { '93221497' }
  let(:output_dir)     { described_class::OUTPUT_DIR }
  let(:output_file_name) do
    output_dir.join("#{format('%08d', hokensha_bango.to_i)}-#{Time.current.strftime('%Y%m%d%H%M%S')}.csv")
  end

  let(:endpoint)       { '/ope/passcodes/passcode_kohai_reserve' }
  let(:member_hash_request) do
    {
      index:     0,
      kigo:      9,
      bango:     9,
      birthday:  '1994-10-25',
      postal_code: '2227777',
      name_kana: "ディズニー フジタ",
      address: '東京都足立区〜'
    }
  end

  let(:params) do
    {
      hokensha_bango: hokensha_bango,
      members:        [member_hash_request]
    }
  end

  let(:member_hash_response) do
    member_hash_request.merge(
      member_id: member.id,
      passcode:  member.passcode.code
    )
  end

  let(:expect_body_matched)    { [member_hash_response] }
  let(:expect_body_mismatched) { [member_hash_request] }
  let(:yamazaki) { Yamazaki::Client }
  let(:yamazaki_fetch) { Yamazaki::PasscodeKohaiReserveFetch }
  # let(:yamazaki_fetch) { yamazaki }
  let(:client) { yamazaki.new }

