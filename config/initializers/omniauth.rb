require 'omniauth/strategies/nft'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :nft,
           checker_type: :opensea,
           checker_options: { testnet: true },
           nft_collection: { slug: 'untitled-collection-4919696' }
  provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
