module SettingsHelper

  def change_on_br(line)
    line.gsub("\n", "<br />").html_safe 
  end
end
