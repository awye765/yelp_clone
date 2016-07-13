module ApplicationHelper

  def sign_up(email: 'abc@abc.com', password: 'testtest', confirm: 'testtest')
    visit '/'
    click_link 'Sign up'
    fill_in :Email, with: email
    fill_in :Password, with: password
    fill_in :'Password confirmation', with: confirm
    click_button 'Sign up'
  end

end
