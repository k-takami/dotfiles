## PC余白明け
@H 
def spacer_unless_mobile(blank_line_number = 1)
     return nil if request.smart_phone? || request.mobile? # || request.tablet?
        raw('<br/>' * blank_line_number)
         end

＠CSS
@media screen and (min-width: 720px) {
  .footer address {
     margin-left: 20%;
  }
}

@YAML/@V
title: 文字<br />場合によって改行する文字

#title tag <tltle>
  def login_page_title
    # OPTIMIZE: ideally metatags below;
    # <meta http-equiv="X-UA-Compatible" content="IE=edge">
    # <meta name="viewport" content="width=960,user-scalable=yes">
    rp = request.path
    if %w(/userchg /user).include?(rp) || %w(/passwordchg /emailchg).map{|i| rp.start_with? i}.any?
      "#"
    else
      name_of_controller == 'sso' ? "%%%%%%" : nil
    end
  end


