require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///Hubblefly.db"

class Professor < ActiveRecord::Base
end

class Course < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end