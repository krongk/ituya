# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ituya_session',
  :secret      => '885d1118fa2fbbd3b0a8cf52293cb788ba0c24535890b1bb723e976f60c76ae33baae31184de17b3e17a5e8ea64a25deb05a4ec5b5ba0fa994af26331c476bfe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
