require "rubygems"
require "bundler/setup"
require "json"  
require 'zip'
require 'digest'
require "faraday"

require "net/http"

class Qiita_Client

  BASE_URL = 'https://qiita.com'
  ENDPOINT = {
    CREATE: '/api/v2/items',
    UPDATE: '/api/v2/items/:'
  }

  def initialize(access_token)
    p access_token.class
    @access_token = access_token[0]
  end

  def create_item(date, headers)
    url = BASE_URL + ENDPOINT[:CREATE]
    self.api(url, date, headers, "create")
  end

  def update_item(item_id, date, headers)
    url = BASE_URL + ENDPOINT[:UPDATE] + item_id
    self.api(url, date, headers, "update")
  end

  def api(url, params, headers, type)
    uri = URI.parse(url)
    headers["Authorization"] = "Bearer " + @access_token

    if type == "create"
      response = Faraday.post(uri.to_s, params.to_json, headers)
    elsif type == "update"
      response = Faraday.patch(uri.to_s, params.to_json, headers)
    else
      response = "no such a request type"
    end
    {status: response.status, body: response.body, headers: response.headers}
  end
end

def self.checksum(dir)
  files = Dir["#{dir}/**/*"].reject{|f| File.directory?(f)}
  content = files.map{|f| File.read(f)}.join
  Digest::SHA256.hexdigest(content).to_s
end

def self.upload2qiita(dir)
  publish_check_path = dir + '/.publish'
  params_file_path = dir + '/params.json'
  item_id_file_path = dir + '/ITEM_ID'
  body_file_path = dir + '/main.md'

  if (not File.exist?(publish_check_path)) or (not File.exist?(params_file_path)) or (not File.exist?(body_file_path))
    return
  end
  
  p ENV
  p ENV["QIITA_TOKEN"]
  client = Qiita_Client.new(access_token: ENV["QIITA_TOKEN"])
  
  params = File.open(params_file_path) do |file|
    JSON.load(file)
  end
  headers = {'Content-Type' => 'application/json'}
  
  body = File.open(body_file_path) do |file|
    file.read
  end
  
  params['body'] = body
  
  if File.exist?(item_id_file_path) then
    item_id = File.open(item_id_file_path) do |file|
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

# upload to qiita
updated_folders.each do |d|
  upload2qiita(d)
end


# save hash values
open(HASH_FILE_PATH, "w") do |file|
  JSON.dump($hash, file)
end


