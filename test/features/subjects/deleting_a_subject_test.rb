require "test_helper"

feature "Deleting a Subject" do
  scenario "click the delete button on the subject page" do
    # Given I'm a logged in user and visit an existing subject page
    sign_in
    visit subject_path(subjects(:tie))

    # When I click the delete link
    click_on "Delete"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Subject was successfully deleted"
    page.find('.subjects-grid').text.wont_include subjects(:tie).title
  end
end
