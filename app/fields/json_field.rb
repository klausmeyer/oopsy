class JsonField < Trestle::Form::Field
  def field
    raise NotImplemented unless readonly?

    Rouge::Formatters::HTML.format(
      Rouge::Lexers::JSON.lex(
        pretty_json
      )
    ).html_safe
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
