require "test_helper"

feature "Editing a Step" do
  scenario "submit form data to edit an existing step" do
    # Given I'm a logged in user and visit an existing step page
    sign_in
    visit subject_step_path(subjects(:tie), steps(:tie_step_one))
    click_on "Edit"

    # When I click the edit link and submit changes to the form
    fill_in "Title", with: "Edited title"
    fill_in "Description", with: steps(:tie_step_one).description
    click_on "Save Step"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Step was successfully updated"
    page.find('h2').text.must_include "Edited title"
  end
end
