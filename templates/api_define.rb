require 'aliyun/openapi'

module Aliyun::Openapi
  Core::ApiDSL.define('openapi').<%= @product %>(version: '<%= @version %>').<%=@api_name%>.end_point do |end_point|
        <% @api_params.each do |param| %><% rest_param = param.reject {|k,v| ['tagName', 'type', 'required'].include? k} %>
     end_point.param <%= ":'#{param['tagName']}', :#{param['type']}, #{param['required']}, #{rest_param}" %>
        <% end %>
     end_point.methods = <%= @api_detail['isvProtocol']['method'].split('|').to_s %>
     <% if @api_detail['isvProtocol']['pattern'] %>
     end_point.pattern = "<%= @api_detail['isvProtocol']['pattern'] %>"
     <% end %>
  end
end