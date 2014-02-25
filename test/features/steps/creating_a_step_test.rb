require "test_helper"

feature "Creating a Step" do
  scenario "submit form data to create a new step" do
    # Given I'm a logged in user on a subject page
    sign_in
    visit subject_path(subjects(:tie))

    # when I click add new step and submit the form
    click_on "Add New Step"
    fill_in "Title", with: "Done"
    fill_in "Description", with: "Presto! You tied a tie"
    click_on "Save Step"

    # Then a new step should be created and displayed
    page.text.must_include "Step was successfully created"
    page.find('.steps-list').text.must_include "Done"
  end
end
