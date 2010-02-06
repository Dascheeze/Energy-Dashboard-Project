# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ecd_session',
  :secret      => '794a6abe9a85d22960d2ea6941e8f6f6ec08e8d53031249a5a6c60895672cbd3cbab704d8f22e5b4487522d055da7d3bec8876cf646da3877108235de0f46715'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
