require 'spec_helper'

feature "user visits meetups main page" do
  # I should see the name of each meetup.
  # Meetups should be listed alphabetically.

  # the name of each meetup should be a link to the meetup's show page.

  # There should be a link from the meetups index page that takes you to
  # the meetups new page.


  scenario "view alphabetical list of all meetups" do

    event_1 = Event.create!({
      name: "People who love their sports!",
      description: "A get together for fans of sports",
      location: "Pat's Tap",
      creator: "touchdowntommy12"
      })

    event_2 = Event.create!({
      name: "Let's play Tecmo Bowl!",
      description: "Fans of Tecmo Bowl, let's test our skills!",
      location: "Gordy's Gaming Emporium",
      creator: "touchdowntommy12"
      })

    event_3 = Event.create!({
      name: "A is for acceptance (testing)",
      description: "Let's practice acceptance testing",
      location: "Cathy's coding shack",
      creator: "jarlax1"
      })

    visit "/"
      expect(page).to have_content(event_1.name)
      expect(page).to have_content(event_2.name)
      expect(page).to have_content(event_3.name)

      expect(page).to have_content "Meetup Name: #{event_3.name} Meetup Name: #{event_2.name} Meetup Name: #{event_1.name}"

      find_link(event_1.name)
      click_link(event_1.name)

      expect(page.body).to have_content("Meetup Details")
  end
end
