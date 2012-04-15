#encoding: utf-8;

# Initialize your textile guide here
# Define elements for each one.
TEXTILE_GUIDE = Textile::Guide.new do
  add("*Bold*")
  add("_Itálicas_")
  add("-Tachado-")
  add("+Subrayado+")
  add("p{color:red;}. Texto Rojo")
  add("* Un elemento")
  add("p(note). Una nota")
  add('"El link del wiki":http://wiki.innku.com')
  add('# Lista enumerada')
  add('* Lista no numerada')
  add("<code lang=\"ruby\">puts 'Awesome' if user.writes_ruby?</code>") do |example|
    example.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class, :line_numbers => :table).html_safe)
    end
  end
end
