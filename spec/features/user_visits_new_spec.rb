require 'spec_helper'
  # On this page there is a form to create a new meetup.
  # I must be signed in, and I must supply a name, location,
  # and description.
  #
  # If the form submission is successful, I should be
  # brought to the meetup's show page, and I should see a
  # message that lets me know that I have created a meetup successfully.
  #
  # If the form submission is unsuccessful, I should
  # remain on the meetups new page, and I should see error
  # messages explaining why the form submission was unsuccessful.
  # The form should be pre-filled with the values that were
  # provided when the form was submitted.

feature "user visits meetups new meetup page" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "3",
      username: "bojackrulez",
      email: "tecmochamp@yahoo.com",
      avatar_url: "http://gamelab.mit.edu/wp/wp-content/uploads/2013/03/bo_jackson_tecmo_bowl1.jpg"
      )
  end

  scenario "user visits meetups/new page" do
    visit '/meetups/new'

    expect(page).to have_content("Create a Meetup")
  end

  scenario "user successfully creates meetup" do
    sign_in_as user
    visit '/meetups/new'

    fill_in "name", with: "Beer buds"
    fill_in "description", with: "Beer snobs unite to discuss the best double malt triple hop IPA"
    fill_in "location", with: "Billy's Beer Bar"

    click_button "Create Meetup"

    event = Event.last
    visit "/meetups/#{event.id}"
    expect(page).to have_content "Beer buds"
  end

  scenario "user fails to create meetup" do
    sign_in_as user
    visit '/meetups/new'

    fill_in "name", with: "Beer buds"

    click_button "Create Meetup"

    expect(page).to have_current_path("/meetups/new")
  end
end
