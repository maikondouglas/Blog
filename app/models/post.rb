# frozen_string_literal: true

class Post < ApplicationRecord
  include PgSearch
  extend FriendlyId

  validates :title, :body, :author, presence: true

  has_many :comments, dependent: :destroy

  friendly_id :title, use: :slugged

  pg_search_scope :search,
                  against: %i[title body author],
                  associated_against: { comments: %i[body] }
end
