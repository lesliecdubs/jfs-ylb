module CustomHelpers
  def local_path(path, options = {})
    lang = options[:language] ? options[:language] : I18n.locale.to_s
    if lang == 'en'
      "/#{path}"
    else
      "/#{lang}/#{path}"
    end
  end
end
