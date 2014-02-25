require "test_helper"

feature "Editing a Subject" do
  scenario "submit form data to edit an existing subject" do
    # Given I'm a logged in user and visit an existing subject page
    sign_in
    visit subject_path(subjects(:tie))
    click_on "Edit"

    # When I click the edit link and submit changes to the form
    fill_in "Title", with: "Edited title"
    fill_in "Description", with: subjects(:shoe).description
    click_on "Save Subject"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Subject was successfully updated"
    page.text.must_include "Edited title"
  end
end
