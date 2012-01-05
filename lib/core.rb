# encoding: utf-8

#
# All String, Fixnum, Float and DateTime class will be extended by this module
#
module CoreExt

  # Returns String
  # Converts to Bangla digits only when applied to Fixnum, Float, String and DateTime object
  # Example: "123".to_bddigit
  # "abc89efg".to_bddigit
  # Deal.first.start_date.to_bddigit
  # 89.567.to_bddigit
  #
  def to_ld(locale=:en)
    item = self
    digit_map = {
      :bn => {'0' => '০', '1' => '১', '2' => "২", '3' => '৩', '4' => '৪', '5' => '৫', '6' => '৬', '7' => '৭', '8' => '৮', '9' => '৯'},
      :en => {'0' => '0', '1' => '1', '2' => "2", '3' => '3', '4' => '4', '5' => '5', '6' => '6', '7' => '7', '8' => '8', '9' => '9'}
      }
    translated_item = ""
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
