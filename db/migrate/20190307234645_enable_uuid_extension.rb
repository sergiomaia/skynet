class EnableUuidExtension < ActiveRecord::Migration[5.2]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  end
end
