require 'fileutils'
require 'js'

$completed_load_assets = false

def write_file(path)
  dirname = File.dirname(path)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end

  fetched = JS.global.fetch(path).await.text.await
  File.write(path, fetched)
end

list = %w(
  templates/default.svg
  templates/html.svg
  templates/minimal.svg
)

list.each do
  write_file(_1)
end

$completed_load_assets = true
