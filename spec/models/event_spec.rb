require 'spec_helper'

describe Event do
  it {should have_many(:acts)}
  it {should have_one(:venue)}
end
