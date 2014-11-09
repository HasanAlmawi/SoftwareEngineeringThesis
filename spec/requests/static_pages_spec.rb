require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home page" do
    it "should have the right title" do
    	visit root_path
    	it{should have_selector('title',
    	 :text => "Ruby on Rails Tutorial Sample App")}
    end
  end
  describe "Contact page" do
    before { visit contact_path }

 		it {should have_selector('h1', text: 'Contact')}
	  it {should have_selector('title', 
			  text: full_title(''))}

  end
end
describe "User pages" do
  subject {page}
  describe "signup page" do
    before {visit _signup_path}
    it { should have_selector('h1', text: 'Sign Up')}
    it { should have_selector('title', text: full_title('Sign up'))}
  end
end