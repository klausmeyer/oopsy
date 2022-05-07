class BacktraceField < Trestle::Form::Field
  def field
    raise NotImplemented unless readonly?

    return "-" unless backtrace.is_a? Array

    output = []

    backtrace.each do |entry|
      output << "<pre>".html_safe
      output << entry["file"] << ":" << entry["line"] << " &middot; ".html_safe << content_tag(:strong) { entry["function"] }
      output << "</pre>".html_safe

      if entry.has_key?("code")
        output << "<table class='backtrace'>".html_safe

        entry["code"].each do |line, code|
          output << "<tr>".html_safe
          output << content_tag(:td, class: "line-number") { line }
          output << content_tag(:td, class: "line-code") { highlight(code, entry["file"].split(".").last) }
          output << "</tr>".html_safe
        end

        output << "</table>".html_safe
      end
    end

    safe_join output
  end

  private

  def readonly?
    !!options[:readonly]
  end

  def backtrace
    builder.object.public_send(name)
  end

  def highlight(text, language)
    return pre_tag("&nbsp;") if text.blank?
    return pre_tag(text) if (lexer = Rouge::Lexer.find(language)).nil?

    Rouge::Formatters::HTML.format(lexer.lex(text)).html_safe
  end

  def pre_tag(text)
    %(<pre class="highlight">#{text}</pre>).html_safe
  end
end
