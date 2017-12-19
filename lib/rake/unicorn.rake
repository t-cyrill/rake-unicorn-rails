require 'pathname'

namespace :unicorn do
  desc 'Start unicorn'
  task :start => :environment do
    sh "#{env} bundle exec unicorn -c #{unicorn_config_path} -E #{rails_env} -D", {chdir: rails_root}, {}
  end

  desc 'Stop unicorn gracefully (Send QUIT signal)'
  task :stop => :environment do
    send_signal 'QUIT'
  end

  desc 'Restart unicorn (stop/start)'
  task :restart => :environment do
    Rake::Task['unicorn:stop'].invoke
    Rake::Task['unicorn:start'].invoke
  end

  desc 'Restart unicorn (Send USR2 signal)'
  task :reload => :environment do
    send_signal 'USR2'
  end

  desc 'Stop unicorn immediately (Send TERM signal)'
  task :force_stop => :environment do
    send_signal 'TERM'
  end

  task :debug => :environment do
    %w(current_path unicorn_pid rails_env rails_root).each do |m|
      puts "#{m}: #{send(m)}"
    end
  end

  private
  def current_path
    Rails.root.join('../../current').cleanpath.to_s
  end

  def unicorn_pid
    File.read(Rails.root.join('tmp/pids/unicorn.pid').to_s).to_i
  end

  def send_signal(signal)
    sh "kill -s #{signal} #{unicorn_pid}"
  end

  def rails_env
    ENV['RAILS_ENV'] || 'development'
  end

  def rails_root
    Rails.root.to_s
  end

  def unicorn_config_path
    Rails.configuration.x.unicorn.config_path || "#{current_path}/config/unicorn/#{rails_env}.rb"
  end

  def bundle_gemfile_path
    Rails.configuration.x.unicorn.bundle_gemfile_path || "#{current_path}/Gemfile"
  end

  def env
    "BUNDLE_GEMFILE=#{bundle_gemfile_path}"
  end
end
