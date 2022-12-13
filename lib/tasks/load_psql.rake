namespace :db do
  namespace :psql do
    desc 'Loads Psql functions into the given database'
    task :load, [:shard_name] => :environment do |_t, _args|
      pattern = File.join(Rails.root, 'db', 'psql', '*.sql')
      files = Dir[pattern]

      files.sort.each do |file|
        puts "Running psql migration file: #{file}"
        ApplicationRecord.connection.execute(File.read(file))
      end
    end
  end
end
