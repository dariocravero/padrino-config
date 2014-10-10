Quick example on how to use sinatra-contrib/config_file and reuse it in something like a Rake task
without having to do the whole `Padrino.mounted_apps.find({|item| item.name == 'MyApp::App'}).app_obj.settings.my_config_parameter` mess.

[Ref](http://irclogger.com/.padrino/2014-10-09#1412885465).

[Ref 2](http://irclogger.com/.padrino/2014-10-10#1412963821).

```
# app/app.rb

module PadrinoConfig
  class App < Padrino::Application
    # ...
    register Sinatra::ConfigFile
    config_file PadrinoConfig::SETTINGS
    # ...
  end
end
```

```
# lib/padrino-config.rb
module PadrinoConfig
  PadrinoConfig::SETTINGS = Padrino.root('config/settings.yml')

  def self.[](key)
    self.config[Padrino.env.to_s][key.to_s]
  end

  private
    def self.config
      @@config ||= YAML.load_file PadrinoConfig::SETTINGS
    end
end
```

```
---
# config/settings.yml
development: &common_settings
  foo: bar
test:
  <<: *common_settings
production:
  <<: *common_settings
```
