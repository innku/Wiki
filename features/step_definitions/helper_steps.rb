Given /^the date is freezed$/ do
  new_time = Time.local(2012, 3, 27, 12, 0, 0)
  Timecop.freeze(new_time)
end
