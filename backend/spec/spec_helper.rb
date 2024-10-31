require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/config/'
  add_filter '/spec/'
end
