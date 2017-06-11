# == Schema Information
#
# Table name: intros
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  image      :string
#  link       :string
#  is_hidden  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Intro < ApplicationRecord
# 新增/修改欄位限制與提示 #
validates :title, presence: true
validates :content, presence: true
validates :link, presence: true

# 檔案上傳 #
mount_uploader :image, IntroUploader

# Scope #
scope :published, -> { where(is_hidden: false) }

# 發佈 / 隱藏 #
def publish!
  self.is_hidden = false
  self.save
end

def hide!
  self.is_hidden = true
  self.save
end
end
