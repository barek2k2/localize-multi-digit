# encoding: utf-8

#
# Fixnum, Float, String, Date, Time and DateTime class will be extended by this module
#
module CoreExt

  # Returns String
  # Converts to Bangla digits only when applied to Fixnum, Float, String, Date, Time and DateTime object
  
  def to_ld
    item = self
    digit_map = {
      :bn => {'0' => '০', '1' => '১', '2' => "২", '3' => '৩', '4' => '৪', '5' => '৫', '6' => '৬', '7' => '৭', '8' => '৮', '9' => '৯'},
      :en => {'0' => '0', '1' => '1', '2' => "2", '3' => '3', '4' => '4', '5' => '5', '6' => '6', '7' => '7', '8' => '8', '9' => '9'},
      :ar => {'0' => '٠', '1' => '١', '2' => "٢", '3' => '٣', '4' => '٤', '5' => '٥', '6' => '٦', '7' => '٧', '8' => '٨', '9' => '٩'},
      :hn => {'0' => '०', '1' => '१', '2' => "२", '3' => '३', '4' => '४', '5' => '५', '6' => '६', '7' => '७', '8' => '८', '9' => '९'}
      }
    translated_item = ""
    begin
      locale = I18n.locale
    rescue Exception => error
      locale = :en
    end
    item.to_s.split("").each do |c|
      if c.to_i > 0 || c == '0'        
        translated_item += digit_map[locale][c]
      else
        translated_item += c
      end
    end
    return translated_item
  end
end
