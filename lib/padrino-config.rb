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
