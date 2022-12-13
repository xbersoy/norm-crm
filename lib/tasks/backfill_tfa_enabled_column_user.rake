# frozen_string_literal: true

namespace :data_migrations do
  desc 'backfill otp_required_for_login column in users table'
  task backfill_otp_required_for_login_column: :environment do
    User.in_batches do |users|
      users.update_all(otp_required_for_login: false)
      sleep(0.01)
    end
  end
end
