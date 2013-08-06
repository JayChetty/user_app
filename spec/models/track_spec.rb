# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  shelf_id   :integer
#  title      :string(255)
#  artist     :string(255)
#  url        :string(255)
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Track do
  pending "add some examples to (or delete) #{__FILE__}"
end
