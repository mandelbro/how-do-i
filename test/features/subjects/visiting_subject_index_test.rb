require "test_helper"

feature "Editing a Subject" do
  scenario "submit form data to edit an existing subject" do
    # Given I visit the homepage
    visit root_path

    # When I click on a link from the main list
    page.find(".subjects-grid").click_on subjects(:tie).title

    # The form should submit successfully and the changes should be on the show page
    page.find("h1").text.must_include subjects(:tie).title
  end
end
