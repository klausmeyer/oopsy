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
        output << "<table width='100%'>".html_safe

        entry["code"].each do |line, code|
          output << "<tr>".html_safe
          output << content_tag(:td, style: "text-align: right; vertical-align: top; font-size: small") { line }
          output << content_tag(:td) { highlight(code, entry["file"].split(".").last) }
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
    return "<pre class=hightlight>&nbsp;</pre>".html_safe if text.blank?

    Rouge::Formatters::HTML.format(
      Rouge::Lexer.find(language).lex(
        text
      )
    ).html_safe
  end
end
