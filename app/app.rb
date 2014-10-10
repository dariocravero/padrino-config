module PadrinoConfig
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    register Sinatra::ConfigFile
    config_file PadrinoConfig::SETTINGS

    enable :sessions

    get :index do
      "foo: #{settings.foo}"
    end
  end
end
