# frozen_string_literal: true

require 'spec_helper'

describe "spree/admin/shared/_navigation_header", type: :view do
  let(:user) { FactoryBot.build_stubbed(:admin_user) }
  let(:ability) { Object.new.extend(CanCan::Ability) }
  before do
    allow(view).to receive(:try_spree_current_user).and_return(user)
    allow(controller).to receive(:current_ability).and_return(ability)
  end

  it "has an admin link" do
    render
    expect(rendered).to have_selector("a[href='/admin']")
  end
end
