require 'yaml'
require 'pry'

def load_library(file)
emoticons = YAML.load(File.read(file))
result = {}
emoticons.each do |meaning, value|
  result[meaning] = {}
  result[meaning][:english] = {}
  result[meaning][:japanese] = {}
  result[meaning][:english] = value[0]
  result[meaning][:japanese] = value[1]
  end
  result 
end


def get_japanese_emoticon(file, eng_emote)
  emoticons = load_library(file)
  jap_emote =  ""
  emoticons.each do |key, value|
    if eng_emote == emoticons[key][:english]
     jap_emote = emoticons[key][:japanese]
    end
  end
    if jap_emote != ""
      jap_emote
    else
     "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file, jap_emote)
  emoticons = load_library(file)
  meaning =  ""
  emoticons.each do |key, value|
    if jap_emote == emoticons[key][:japanese]
     meaning = key
    end
  end
    if meaning != ""
      meaning
    else
     "Sorry, that emoticon was not found"
    end 
end