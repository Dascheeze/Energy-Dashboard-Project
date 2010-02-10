# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ecd_session',
  :secret      => '5d597e9e470f840569840bf46266bd203a7ddfe64d1b4761728c4916f23afe6f77153f3970a8cbe7f0a980f08f2ea13b8e46b386d4c598719b1217ef43bfc3ad'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
