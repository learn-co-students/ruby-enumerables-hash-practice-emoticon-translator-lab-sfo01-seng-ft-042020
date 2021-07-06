# require modules here

require 'yaml'

def load_library(path)
  input = YAML.load_file(path)
  output = {}
  
  input.each do |key,value|
    output[key]= {}
  end 
  output.each do |key,value|
    output[key] = { :english => "", :japanese => ""}
  end 
  output.each do |key,value| 
    output[key][:english] = input[key][0]
  end 
  output.each do |key,value|
    output[key][:japanese] = input[key][1]
  end 
end


def get_english_meaning(file_path, emoticon)
  input = YAML.load_file(file_path)
  trash = load_library(file_path)
  translate_map = {} 
  input.each do |key, value|
    translate_map[value[1]] = key
  end
  translate_map[emoticon] ? translate_map[emoticon] : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  input = YAML.load_file(file_path)
  trash = load_library(file_path)
  translate_map = {} 
  input.each do |key, value|
    translate_map[value[0]] = value[1]
  end
  translate_map[emoticon] ? translate_map[emoticon] : "Sorry, that emoticon was not found"
end