# == Schema Information
#
# Table name: article_collections
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleCollection < ApplicationRecord
  # 收藏文章关系
  belongs_to :user
  belongs_to :article
end
