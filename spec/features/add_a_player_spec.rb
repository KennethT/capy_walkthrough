require 'rails_helper'

describe 'add a player' do

# before all the tests, we create a team
  before :each do
    @my_team = Team.create(name: 'pizza and the woofers')
    # capybara visit the page stated below, moved to before to refactor and optimize visit being used twice
    visit "teams/#{@my_team.id}/players/new"
  end


  it "goes to the page and has a team name" do
    expect(page).to have_content @my_team.name
  end

  it "adds a player with a name" do
    fill_in "Name", with: "Puggeroni"
    click_button "Create Player"
    expect(page).to have_content "Puggeroni"
  end


end
