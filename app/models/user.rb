class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }, presence: true

  def self.find_or_create_from_auth_hash(auth)
    identity = { provider: auth['provider'], uid: auth['uid'] }
    User.find_or_create_by!(identity) do |record|
      case auth[:provider]
      when 'developer'
        raise 'I refuse to create a developer account for ' + auth[:uid]
      when 'nft'
        record.name = auth.info['name']
        record.profile_url = auth.info['image']
      else
        raise 'Unexpected provider!'
      end
    end
  end
end
