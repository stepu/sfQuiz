# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fsquiz_session',
  :secret      => '9ff63b33b4217a31a40e9c1716d3b0dc0a2401be1aafcad9475bc4bbad96ecfc7f726ef2774e628944416a8a0bdffa45173ef5d1172b4232a0b0016f0889a167'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
