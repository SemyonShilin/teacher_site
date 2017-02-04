# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'images', '*')
Rails.application.config.assets.precompile += %w( ckeditor/* )
Rails.application.config.assets.precompile += %w( a1.jpg a2.jpg logo.png pic8.jpg pic9.jpg 123.png 123(e).png)
