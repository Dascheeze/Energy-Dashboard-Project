# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ecd_session',
  :secret      => '1e02f69a44db9b8e260ef5d6fdcf66bd81cf36993c31e88e68f61206334eb06c15ea531d9865e22dae4e70410f5a681f69aefd6b1bbae8e4796a7ca089fca5fb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
