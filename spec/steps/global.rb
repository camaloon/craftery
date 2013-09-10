module Turnip::Steps

  # Generic HTML

  step "I click the :link_name link" do |link_name|
    click_on link_name
  end

  step "I fill/modify the values of the form as follows" do |table|
    table.hashes.each do |hash|
      fill_in hash['Field'], with: hash['Value']
    end
  end

  # Implementation specific

  step "the system informs me of the operation's success stating :message" do |message|
    page.should have_content 'Success: ' + message
  end

end

