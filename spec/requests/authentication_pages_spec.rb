require 'spec_helper'

describe "Auth" do
	subject { page }
	describe ": signin" do
		before { visit signin_path }
		
		describe ": invalid" do
			before { click_button "Sign in" }

			it { should have_title('Sign in') }
			# it { should have_selector('div.alert.alert-error') }
			it { should have_error_message('Wrongo Bongo') }

			describe ": back to home" do
				before { click_link "Home" }
				it { should_not have_selector('div.alert.alert-error') }
			end

		end

		describe ": valid" do
			let(:user) { FactoryGirl.create(:user) }
			# before do
			# 	fill_in "Email",	with: user.email.upcase
			# 	fill_in "Password",	with: user.password
			# 	click_button "Sign in"
			# end
			before { valid_signin(user) }

			it { should have_title(user.name) }
			it { should have_link('Profile', 		href: user_path(user)) }
			it { should have_link('Sign out',		href: signout_path) }
			it { should_not have_link('Sign in',	href: signin_path) }

			describe ': signout' do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
			end
		end
	end
end
