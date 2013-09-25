require 'spec_helper'

describe Act do
  it {should belong_to(:event)}
  it {should have_many(:performers).through(:performer_act)}
end
