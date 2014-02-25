require "test_helper"

feature "Deleting a Step" do
  scenario "click the delete button on the step page" do
    # Given I'm a logged in user and visit an existing step page
    sign_in
    visit subject_step_path(subjects(:tie), steps(:tie_step_one))

    # When I click the delete link
    click_on "Delete"

    # The form should submit successfully and the changes should be on the show page
    page.text.must_include "Step was successfully deleted"
    page.find('.steps-list').text.wont_include steps(:tie_step_one).title
  end
end
