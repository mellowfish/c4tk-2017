module ApplicationHelper
  def key_value_row(key, value)
    <<-HTML.html_safe
<dl class="row">
  <dt class="large-2 columns text-right">#{key}</dt> 
  <dd class="large-10 columns">#{value}</dd>
</dl>
    HTML
  end

end
