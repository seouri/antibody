namespace :antibody do
  desc "Create database, load the schema, and initialize with data"
  task :setup => :environment do
    Rake::Task["db:create"].invoke
    Rake::Task["db:schema:load"].invoke
    Rake::Task["antibody:update:all"].invoke
  end

  desc "recreate database, load the schema, and initialize with data"
  task :reset => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["antibody:setup"].invoke
  end

  desc "load Antibody data"
  task :load, :file, :needs => :environment do |task, args|
    file = args[:file]
    File.open(file, "r") do |f|
      records = []
      columns = []
      f.each_line do |line|
        if f.lineno == 1
          columns = line.strip.split(/\t/).map {|a| a.to_sym}
        else
          params = {}
          values = line.strip.split(/\t/)
          values.each_index do |i|
            key = columns[i]
            params[key] = values[i]
          end
          records << Antibody.new(params)
        end
      end
      Antibody.import records
    end
  end

  namespace :update do
    desc "update all data"
    task :all => :environment do
      [].each do |task|
        Rake::Task["antibody:update:#{task}"].invoke
      end
    end
  end
end