module ApplicationHelper
  def devise_error_messages
   return "" if resource.errors.empty?
   html = ""
   # エラーメッセージ用のHTMLを生成
   messages = resource.errors.full_messages.each do |msg|
     html += <<-EOF
       <div class="alert" role="alert">
         <span class="error_msg">#{msg}</span>
       </div>
     EOF
   end
   html.html_safe
 end
end
