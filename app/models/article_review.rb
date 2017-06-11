# == Schema Information
#
# Table name: article_reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  article_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleReview < ApplicationRecord
  belongs_to :user
  belongs_to :article
end
