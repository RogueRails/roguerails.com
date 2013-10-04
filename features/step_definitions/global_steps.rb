#navigation

When(/^I visit "(.*?)"$/) do |path|
  visit path
end

#debug

When(/^I print$/) do
  print page.html
end

When /^I debug$/ do
  p current_path
  p page.response_headers
end

When /^I wait (.*?) seconds?/ do |seconds|
  sleep(seconds.to_i)
end

When /^I take a screenshot( named "(.+)")?$/ do |has_name, name|
  name = name.presence || "screenshot"
  page.save_screenshot "tmp/capybara/#{name}-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
end

#clicking

#user for clicking on non anchors or buttons
When(/^I click tag with selector "(.*?)" within "(.*?)"$/) do |selector, container|
  find(container).find(selector).click
end

When(/^I click "(.*?)"( within "(.*?)")?$/) do |target, is_scoped, scope|
  retry_if_fails do
    if is_scoped
      within scope do
        click_on target
      end
    else
      click_on target
    end
  end
end

When /^I click link "(.*?)"$/ do |target|
  click_link target
end

When /^I accept an alert box$/ do
  page.execute_script 'window.confirm = function () { return true }'
end

When /^I cancel an alert box$/ do
  page.execute_script 'window.confirm = function () { return false }'
end

When(/^drag the element "(.*?)" to "(.*?)"$/) do |draggable, droppable|
  page.find(draggable).drag_to(page.find(droppable))
end

#forms

#When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
#  fill_in field, with: value
#end

When(/^I select "(.*?)" from "(.*?)"$/) do |option, select_tag|
  select(option, :from => select_tag)
end

When /^I fill in the "(.*?)" editor with "(.*?)"$/ do |editor, value|
  page.execute_script("tinyMCE.get('#{editor}').setContent('#{value}')")
end

When(/^I check "(.*?)"$/) do |checkbox|
  check checkbox
end

When(/^I fill in "(.*?)" with "(.*?)"( within "(.*?)")?$/) do |field, value, is_scoped, scope|
  retry_if_fails do
    if is_scoped
      within scope do
        fill_in field, with: value
      end
    else
      fill_in field, with: value
    end
  end
end

When(/^I choose "(.*?)"( within "(.*?)")?$/) do |radio_button, is_scoped, scope|
  retry_if_fails do
    if is_scoped
      within scope do
        choose radio_button
      end
    else
      choose radio_button
    end
  end
end

# Expectations

Then(/^I will (not )?see "(.*?)"( within "(.*?)")?$/) do |negate, content, is_scoped, scope|
  retry_if_fails do
    if is_scoped
      if negate
        within scope do
          page.should_not have_content content
        end
      else
        within scope do
          page.should have_content content
        end
      end
    else
      if negate
        page.should_not have_content content
      else
        page.should have_content content
      end
    end
  end
end

Then(/^I will (not )?see element "(.*?)"(?:\s?(\d+) times?)?$/) do |negate, selector, count|
  options = { visible: false }
  options.merge(count: count) if count.present?
  assert (negate.present? ? page.has_no_css?(selector) : page.has_css?(selector, options)), "Cannot find css selector"
end

Then(/^I will see a table of "(.*?)" where item (\d+) is "(.*?)"$/) do |selector, row_num, content|
  page.should have_selector(".#{selector} tr:nth-child(#{row_num})", text: content)
end

Given /^the (\w+) indexes are processed$/ do |model|
  #model = model.titleize.gsub(/\s/, '').constantize
  ThinkingSphinx::Test.index model
end

Then (/^I will receive a "(.*?)" whose filename is "(.*?)"/) do |type, filename|
  deadline = Time.zone.now + 30.seconds
  content_type = nil
  while Time.zone.now < deadline do
    content_type = page.response_headers['Content-Type']
    break if content_type.include?(type)
    sleep 1
  end
  content_type.should include("#{type}")
  page.response_headers['Content-Disposition'].should include("#{filename}")
end

Then(/^"(.*?)" will( not)? be checked$/) do |checkbox, negate|
  if negate.present?
    !find_field(checkbox).checked?
  else
    find_field(checkbox).checked?
  end
end

Given /^PENDING/ do
  pending
end

