# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bpsearcher_session',
  :secret      => '4f1117c812779fb6ec2566ac0d2835130d6148a855c94dfb1a6bba7fcc6787c6205bdfcae8e9f049e27922964b88b67ab234bb9eed191b86a2ef82cd234b639f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
