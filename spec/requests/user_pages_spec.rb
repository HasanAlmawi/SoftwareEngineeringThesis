require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector('h1', text: user.name) }
		it { should have_selector('title', text: user.name) }
	end

	describe "signup page" do
		before {visit signup_path}

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: 'Sign up') }
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Create my Account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
			end
		end

		describe "after saving the user" do
			it { should have_link('Sign out') }
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit edit_user_path(user) }

		describe "page" do
			it { should have_selector('h1', text: "Update your profile") }
			it { should have_selector('title', text: "Edit user") }
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { sign_in user }

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Settings', href: edit_user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }

		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end
	end
end