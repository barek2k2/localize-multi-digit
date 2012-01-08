require "#{Rails.root}/vendor/plugins/localize-multi-digit/lib/core.rb"

[String, Fixnum, Float, ActiveSupport::TimeWithZone, Time, Date].each do |item|
  item.send(:include, CoreExt)
end