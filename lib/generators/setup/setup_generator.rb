# frozen_string_literal: true

class SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  argument :application_name, type: :string
  argument :email, type: :string
  argument :host, type: :string

  def update_files_with_new_app_name
    # Module name in config/application.rb
    sub_file('config/application.rb', 'Myapp', format_app_name('PascalCase'))
    # Name in package.json
    sub_file('package.json', 'myapp', format_app_name('SnakeCase'))
    # Title in app/views/layouts/application.html.erb
    sub_file('app/views/layouts/application.html.erb', 'Myapp', format_app_name('PascalCase').titleize)
    # Channel prefix in config/cable.yml
    sub_file('app/views/layouts/application.html.erb', 'Myapp', format_app_name('PascalCase').titleize)
    # Database names in config/database.yml
    sub_file('config/database.yml', 'myapp', format_app_name('SnakeCase'))
    # config.active_job.queue_name_prefix in config/environments/production.rb
    sub_file('config/environments/production.rb', 'myapp', format_app_name('SnakeCase'))
  end

  def change_master_key
    $stdout.puts 'WARNING: This action will permanently delete any existing credentials along ' \
                 'with the master key do you wish to continue? (Y)es/(N)o'
    input = $stdin.gets.chomp

    # rubocop:disable Layout/LineLength
    return $stdout.puts 'Aborted: New credentials not created. Continuing with setup' unless input.match?(/^(?:y(?:es)?)$/i)

    # rubocop:enable Layout/LineLength
    delete_file('config/master.key')
    delete_file('config/credentials.yml.enc')
    system('EDITOR=vi rails credentials:edit')
  end

  # doesn't look like this is possible in a generator as the value is store in credentials
  def change_jwt_secret; end

  def update_docker_image_name
    # image name in docker-compose.yml
    sub_file('docker-compose.yml', 'ry-rails', format_app_name('KebabCase'))
  end

  def update_devise
    # config.mailer_sender in config/initializers/devise.rb
    sub_file('config/initializers/devise.rb', 'please-change-me-at-config-initializers-devise@example.com', email) if email
    # config.action_mailer.default_url_options in config/environments/production.rb
    sub_file('docker-compose.yml', 'example.com', host) if host
  end

  private

  # Format the application_name argument using below cases
  def format_app_name(using_case)
    case using_case
    when 'PascalCase'
      application_name.classify
    when 'CamelCase'
      application_name.camelize(:lower)
    when 'SnakeCase'
      application_name.underscore
    when 'UpperSnakeCase'
      application_name.underscore.upcase
    when 'KebabCase'
      application_name.underscore.dasherize
    else
      application_name
    end
  end

  def destination_path(path)
    File.join(destination_root, path)
  end

  def sub_file(relative_file, search_text, replace_text)
    path = destination_path(relative_file)
    file_content = File.read(path)

    return if file_content.exclude?(search_text)

    content = file_content.gsub(/(#{Regexp.escape(search_text)})/mi, replace_text)
    File.open(path, 'wb') { |file| file.write(content) }
    $stdout.puts "Updated: #{relative_file}"
  end

  def delete_file(relative_file)
    File.delete(destination_path(relative_file)) if File.exist?(destination_path(relative_file))
  end
end
