And /^I fill in the date$/ do
  page.execute_script %Q{ $('.datepicker').trigger("focus") }
  page.execute_script %Q{ $("a.ui-state-default:contains('17')").trigger("click") }
end