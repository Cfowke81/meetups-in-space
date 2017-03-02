require 'spec_helper'

# I should see the name, description, location, and the creator of the meetup.
#
# I should see a list of the members that have joined the meetup
# I should see each member's avatar and username.
#
# There should be a button to join the meetup if I am not signed
# in or if I am signed in, but I am not a member of the meetup.
#
# If I am signed in and I click the button, I should see a
# message that says that I have joined the meetup and I should
# be added to the meetup's members list.
#
# If I am not signed in and I click the button, I should
# see a message which says that I must sign in.

feature "user visits meetups main page" do
  let(:user_1) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  let(:user_2) do
    User.create(
      provider: "github",
      uid: "2",
      username: "touchdowntommy12",
      email: "tbisdagreatest@hotmail.com",
      avatar_url: "http://dailysnark.com/wp-content/uploads/2016/09/tom-brady-ftr-twitter-061415_12r0mtmdc6qpj11a5ehe22q1uo.png"
    )
  end

  let(:user_3) do
    User.create(
      provider: "github",
      uid: "3",
      username: "bojackrulez",
      email: "tecmochamp@yahoo.com",
      avatar_url: "http://gamelab.mit.edu/wp/wp-content/uploads/2013/03/bo_jackson_tecmo_bowl1.jpg"
      )
  end

  let(:event) do
    Event.create(
      name: "People who love their sports!",
      description: "A get together for fans of sports",
      location: "Pat's Tap",
      creator: "touchdowntommy12"
      )
  end

  scenario "user views details of selected meetup" do
    visit "/meetups/#{event.id}"
      expect(page.body).to have_content("Meetup Details")

      expect(page).to have_content("People who love their sports!")
      expect(page).to have_content("Description: A get together for fans of sports")
      expect(page).to have_content("Location: Pat's Tap")
      expect(page).to have_content("Creator: touchdowntommy12")
  end

  scenario "user successfully joins meetup" do
    sign_in_as user_3
    visit "/meetups/#{event.id}"

    find_button "Join"
    click_button "Join"

    expect(page).to have_content("Successfully added to event!")
  end

  scenario "user fails to join meetup" do
    visit "/meetups/#{event.id}"

    find_button "Join"
    click_button "Join"

    expect(page).to have_content("You must be signed in to join event")

    sign_in_as user_2

    find_button "Join"
    click_button "Join"

    expect(page).to have_content("You've already joined this event!")
  end
end
