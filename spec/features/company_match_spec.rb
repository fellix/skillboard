require 'rails_helper'

describe 'matching a company with your skills' do
  fixtures :companies, :skills, :jobs

  it 'should return a company when at least one match happens' do
    visit '/'

    check 'Ruby'
    check 'PHP'

    click_on 'Find my dream company'

    expect(page).to have_content 'Subvisual'
    expect(page).to_not have_content 'Sample company'
  end
end