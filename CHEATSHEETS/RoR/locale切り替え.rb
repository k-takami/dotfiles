CSS
  #=== ロケール毎の画像リンク生成
  def i18n_image_tag(source, options = {})
    locale = session[:locale] || "ja"
    file_name, ext = source.split(".")
    locale_source = (locale == "ja") ? "#{file_name}" :
      ext.blank? ? "#{file_name}_#{locale}" :
      "#{file_name}_#{locale}.#{ext}"
    image_tag(locale_source, options)
  end

  #=== ロケール毎に読み込むスタイルシートのタグ生成
  def i18n_stylesheet_link_tag(*sources)
    locale = session[:locale] || "ja"
    file_name, ext = sources.first.split(".")
    unless locale == "ja"
      locale_source =ext.blank? ? "#{file_name}_#{locale}" :
        "#{file_name}_#{locale}.#{ext}"
      sources.first.replace(locale_source)
      return stylesheet_link_tag(*sources)
    end
    ""
  end

