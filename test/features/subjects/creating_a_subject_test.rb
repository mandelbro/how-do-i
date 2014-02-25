require "test_helper"

feature "Creating a Subject" do
  scenario "submit form data to create a new subject" do
    # Given I'm a logged in user on the new subject page
    sign_in
    page.find("#header").click_on "New Subject"
    fill_in "Title", with: subjects(:tie).title
    fill_in "Description", with: subjects(:tie).description

    # When fill out the form and click submit
    click_on "Save Subject"

    # Then a new subject should be created and displayed
    page.text.must_include "Subject was successfully created"
    page.text.must_include subjects(:tie).title
  end
end
