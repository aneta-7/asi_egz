module CommentsHelper
  def biusO(content)
    content.to_str.gsub(/(\[(b|i|u|s)\])/) do |match|
        if match == "[b]"
            "<b>"
        elsif match == "[i]"
           "<i>"
        elsif match == "[u]"
            "<span class='underline'>"
        else
            "<span class='strike'>"
        end
    end.html_safe if content.present?
  end
  
  def biusZ(content)
    content.to_str.gsub(/(\[\/(b|i|u|s)\])/) do |match|
        if match == "[/b]"
            "</b>"
        elsif match == "[/i]"
           "</i>"
        else
            "</span>"
        end
    end.html_safe if content.present?
  end
  
  def enter(content)
      content.to_str.gsub(/\n/) do |match|
        %(<br>)
    end.html_safe if content.present?
  end
end
