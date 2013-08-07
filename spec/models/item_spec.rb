# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  shelf_id    :integer
#  medium      :string(255)
#  medium_desc :string(255)
#  medium_icon :string(255)
#  title       :text
#  creator     :string(255)
#  url         :string(255)
#  image_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
