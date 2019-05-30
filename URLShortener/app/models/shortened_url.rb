# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    new_url = SecureRandom.urlsafe_base64
    until ShortenedUrl.find_by_short_url(new_url) == nil
      new_url = SecureRandom.urlsafe_base64 ##22 character long string
    end
    new_url
  end

  def self.create!(user, long_url)
    new_url = ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
    new_url.save
    new_url
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.map(&:created_at).count { |time| time + 3600 < Time.now }
  end
end
