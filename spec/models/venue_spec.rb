require 'spec_helper'

describe Venue do
  it {should belong_to(:event)}
end
