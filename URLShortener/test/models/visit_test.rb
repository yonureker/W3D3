# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  shortened_url_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
