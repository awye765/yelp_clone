require 'rails_helper'

feature 'reviewing' do

  before { Restaurant.create(name: 'KFC', description: 'Nasty chicken') }

  scenario 'user can click add review link and leave a review' do
    visit '/restaurants'
    sign_up(email: "todd@jobs.com")
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'Far too greasy for my taste'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('Far too greasy for my taste')
  end

  scenario 'displays an average rating for all reviews' do
    sign_up(email: "bob@bob.com", password: 'password', confirm: 'password')
    leave_review('So so', '3')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 3 out of 5 ★★★☆☆')
  end

end
