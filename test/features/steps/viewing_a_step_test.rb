require "test_helper"

feature "Editing a Step" do
  scenario "submit form data to edit an existing step" do
    # Given I visit the a subject with steps
    visit subject_path(subjects(:tie))

    # When I click on a link from the main list
    page.find(".steps-list").click_on steps(:tie_step_one).title

    # The form should submit successfully and the changes should be on the show page
    page.find("h2").text.must_include steps(:tie_step_one).title
    page.text.must_include steps(:tie_step_one).description
    page.text.wont_include subjects(:tie).description
  end
end
