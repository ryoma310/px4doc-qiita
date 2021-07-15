require "rubygems"
require "bundler/setup"
require "qiita"
require "json"  
require 'zip'
require 'digest'

def self.checksum(dir)
  files = Dir["#{dir}/**/*"].reject{|f| File.directory?(f)}
  content = files.map{|f| File.read(f)}.join
  Digest::SHA256.hexdigest(content).to_s
end

def self.upload2qiita(dir)
  PARAMS_FILE_PATH = dir + '/params.json'
  ITEM_ID_FILE_PATH = dir + '/ITEM_ID'
  BODY_FILE_PATH = dir + '/main.md'

  if (not File.exist?(PARAMS_FILE_PATH)) or (not File.exist?(BODY_FILE_PATH))
    return
  end
  
  client = Qiita:: Client.new(access_token: ENV['QIITA_TOKEN'])
  
  params = File.open(PARAMS_FILE_PATH) do |file|
    JSON.load(file)
  end
  headers = {'Content-Type' => 'application/json'}
  
  body = File.open(BODY_FILE_PATH) do |file|
    file.read
  end
  
  params['body'] = body
  
  if File.exist?(ITEM_ID_FILE_PATH) then
    item_id = File.open(ITEM_ID_FILE_PATH) do |file|
      file.read
    end
    p client.update_item(item_id, params, headers)
  else
    p client.create_item(params, headers)
  end
end

# read hash values
HASH_FILE_PATH = 'deploy/hash.json'
if File.exist?(HASH_FILE_PATH) then
  File.open(HASH_FILE_PATH) do |file|
    $hash = JSON.load(file)
  end
else
  $hash = {}
end

p $hash

# ls article dir
dirs = []
Dir.glob('articles/item_*').each do |fn|
  if File.directory?(fn)
    dirs.push(fn)
  end
end

# check diff
updated_folders = []
dirs.each do |d|
  hash_val = checksum(d)
  if (not $hash.key?(d)) or (hash_val != $hash[d])
    updated_folders.push(d)
    $hash[d] = hash_val
  end
end

p "new folder", updated_folders







# save hash values
open(HASH_FILE_PATH, "w") do |file|
  JSON.dump($hash, file)
end


