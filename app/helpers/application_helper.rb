module ApplicationHelper
  def key_value_row(key, value)
    <<-HTML.html_safe
<dl class="row">
  <dt class="small-5 columns text-right">#{key}</dt> 
  <dd class="small-7 columns">#{value}</dd>
</dl>
    HTML
  end
end
