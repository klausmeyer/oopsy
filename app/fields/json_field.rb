class JsonField < Trestle::Form::Field
  def field
    raise NotImplemented unless readonly?

    content_tag :pre, class: "highlight" do
      Rouge::Formatters::HTML.format(
        Rouge::Lexers::JSON.lex(
          pretty_json
        )
      ).html_safe
    end
  end

  private

  def readonly?
    !!options[:readonly]
  end

  def object
    builder.object
  end

  def pretty_json
    JSON.pretty_generate(object.send(name))
  end
end
