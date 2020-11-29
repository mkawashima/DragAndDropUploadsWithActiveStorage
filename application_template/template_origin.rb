def source_paths
  Array(super) +
      [File.join(File.expand_path(File.dirname(__FILE__)))]
end

def add_gems
  gem_group :development, :test do
    gem 'pry-rails'
    gem 'pry-byebug'
  end
end

def config_db
  inside 'config' do
    remove_file "database.yml"
    copy_file 'database.yml'
  end
end

def edit_gitignore
  # JetBrain ide の設定 を ignore
  run "echo '\n.idea\n.idea/*' >> .gitignore"
end

# Main setup
add_gems

after_bundle do
  config_db
  rails_command "db:create"
  edit_gitignore

  git add: "."
end
